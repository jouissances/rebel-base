class BooksController < ApplicationController
    
    before_action :authenticate_user!
    before_action :check_membership_status
    
    before_action :set_club, except: [:new, :create]
    before_action :set_shelf, except: [:new]
    before_action :set_book, except: [:new, :create]
    
    def new
        # Searches for books to add to upcoming shelf
        @book = Book.new
        if params[:search].present? and params[:search].length > 3
            @books = GoogleBooks::API.search("#{params[:search].downcase}", { :count => 30 })
        end
    end

    def create
        # Add book to upcoming shelf
        isbn = params[:isbn]
        added_book = GoogleBooks::API.search("isbn:#{isbn}").first

        @book = Book.new
        @book.title = added_book.title
        @book.description = added_book.description
        @book.author = added_book.authors.join(", ")
        @book.isbn = added_book.isbn_10
        @book.image = added_book.covers[:small]
        @book.image_large = added_book.covers[:extra_large]
        @book.shelf_id = params[:shelf_id]
        @book.save

        upcoming_books = @shelf.upcoming_books
        new_id_list = upcoming_books.push(@book.id)

        @shelf.update_column(:upcoming_books, new_id_list)
        
        redirect_to club_shelf_book_path(:id => @book.id)
    end

    def show
        # Show book details when it's already added on the shelf (instantiated)
        @current_book = @shelf.current_book
        @upcoming_books = @shelf.upcoming_books

        @membership_status = @club.memberships.find_by_user_id(current_user.id)

        @discussion = Discussion.new
        @discussions = Discussion.all

        @comment = Comment.new
    end

    def set_as_current
        # Set a new reading for a particular book
        # Move book from upcoming books collection to current       
        upcoming_books = @shelf.upcoming_books
        new_upcoming_id_list = upcoming_books - [@book.id]
        
        @shelf.update_column(:upcoming_books, new_upcoming_id_list)
        @shelf.update_column(:current_book, @book.id)
        redirect_to @club
    end

    def update
        # Finish reading and move book from current slot to read books collection
        read_books = @shelf.read_books
        new_read_id_list = read_books.push(@book.id)
        
        @shelf.update_column(:current_book, nil)
        @shelf.update_column(:read_books, new_read_id_list)

        redirect_to @club
    end

    def destroy
        # Remove book from all lists altogether
        @book.destroy

        read_books = @shelf.read_books
        read_books.each do |book|
            if book == @book.id
                read_books.delete(book)
                @shelf.save!
            end
        end

        upcoming_books = @shelf.upcoming_books
        upcoming_books.each do |book|
            if book == @book.id
                upcoming_books.delete(book)
                @shelf.save!
            end
        end

        @shelf.update_column(:current_book, nil) if @shelf.current_book == @book.id.to_s

        redirect_to @club
    end

    private
    
    def check_membership_status
        club = Club.friendly.find(params[:club_id])
        membership_status = club.memberships.find_by_user_id(current_user.id)
        unless membership_status
            flash[:danger] = "You are not a member of this club."
            redirect_to club_path(club)
        end
    end

    def set_club
        @club = Club.friendly.find(params[:club_id])
    end

    def set_shelf
        @shelf = Shelf.find(params[:shelf_id])
    end

    def set_book
        @book = Book.friendly.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :description, :isbn, :image, :search)
    end

end

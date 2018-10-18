class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:index, :home]

    def new
        @book = Book.new
        if params[:search].present? and params[:search].length > 3
            @books = GoogleBooks::API.search("#{params[:search].downcase}", { :count => 30 })
        end
    end

    def create
        isbn = params[:isbn]
        added_book = GoogleBooks::API.search(isbn).first

        @book = Book.new
        @book.title = added_book.title
        @book.description = added_book.description
        @book.author = added_book.authors.join(", ")
        @book.isbn = added_book.isbn_10
        @book.image = added_book.covers[:medium]
        @book.shelf_id = params[:shelf_id]
        @book.save

        @shelf = Shelf.find(params[:shelf_id])
        upcoming_books = @shelf.upcoming_books
        new_id_list = upcoming_books.push(@book.id)

        @shelf.update_column(:upcoming_books, new_id_list)

        # Currently, user can add a book directly to the current book shelf.
        # Ideally, books added by the user (regardless of admin status) should go to the upcoming books queue.
        # Admin then can choose to move a particular book to the current book slot.
        # Programmatically — there should be an option for admins in the book#show page to add the book to the current book slot. This should be done via a custom controller method. (Not very RESTful)
        # Remember: The book#show page itself has its own discussion and comments section at this stage.
        # There will be 2 buttons at the book#show page: 
        # 1) Set As Current Book (if book is already set as current book, show 'Finish Read' instead)
        # 2) Remove Book
        # Setting a book as current book will create a new reading — to lead to a new form to create a new reading. Carry the book object over to the new form to auto-fill. Let user fill in details relevant to the reading (datetime, duration, moderator, etc.). Will need to create new migrations for this.

        # Another thing is for users to actually look at the book details first, before adding it to any shelf (before instantiating and saving the book object into the database).

        # TIL: To pass the right params (depending on current location in the nested resource, params[:id] may be used instead of the underscored, more specific version).
        # TIL: To use specified route and action instead of helpers in such cases.
        # TIL: To use arrays column with ActiveRecord and modify its values.
        # TIL: 
        
        redirect_to club_shelf_book_path(:id => @book.id)
    end

    def show
        @book = Book.find(params[:id])
        @shelf = Shelf.find(params[:shelf_id])
    end

    def set_as_current
        # Move book from upcoming books collection to current.
        @shelf = Shelf.find(params[:shelf_id])
        @book = Book.find(params[:id])
        
        upcoming_books = @shelf.upcoming_books
        new_upcoming_id_list = upcoming_books - [@book.id]
        
        @shelf.update_column(:upcoming_books, new_upcoming_id_list)
        @shelf.update_column(:current_book, @book.id)
        redirect_to club_shelf_path(:club_id => params[:club_id], :id => params[:shelf_id])
    end

    def update
        # Move book from current slot to read books collection.
        @shelf = Shelf.find(params[:shelf_id])
        @book = Book.find(params[:id])
        
        read_books = @shelf.read_books
        new_read_id_list = read_books.push(@book.id)
        
        @shelf.update_column(:current_book, nil)
        @shelf.update_column(:read_books, new_read_id_list)
        redirect_to club_shelf_path(:club_id => params[:club_id], :id => params[:shelf_id])
    end

    def destroy
        @book = Book.find(params[:id]).destroy
        @shelf = Shelf.find(params[:shelf_id])

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

        redirect_to club_shelf_path(:club_id => params[:club_id], :id => params[:shelf_id])
    end

    private
    
    def book_params
        params.require(:book).permit(:title, :author, :description, :isbn, :image, :search)
    end

end

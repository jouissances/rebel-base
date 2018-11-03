class ClubsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_club, except: [:index, :new, :create]

    def index
        @clubs = Club.all
        @genres = ["Action", "Adventure", "Classic", "Comedy", "Crime", "Drama", "Dystopia", "Fantasy", "General", "Historical", "Horror", "Mystery", "Non-fiction", "Romance", "Satire", "Sci-Fi", "Tech", "Thriller", "YA-Fiction"]
    end

    def new
        @club = Club.new
        @genres = ["Action", "Adventure", "Classic", "Comedy", "Crime", "Drama", "Dystopia", "Fantasy", "General", "Historical", "Horror", "Mystery", "Non-fiction", "Romance", "Satire", "Sci-Fi", "Tech", "Thriller", "YA-Fiction"]
    end

    def create
        @club = Club.create(club_params)

        if @club.save
            @shelf = Shelf.create(:club_id => @club.id)
            @membership = Membership.create(:user_id => current_user.id, :club_id => @club.id)
            current_user.follow!(@club)
            @membership_status = @club.memberships.find_by_user_id(current_user.id)
            @membership_status.admin = true
            @membership_status.save!
            redirect_to @club
        else
            if @club.errors.any?
                @club.errors.full_messages.each do |msg|
                    flash[:danger] = msg
                end
            end
            redirect_to new_club_path
        end
    end

    def show
        @membership_status = @club.memberships.find_by_user_id(current_user.id)
        @admin_membership = @club.memberships.where(admin: 1)
        @admin = User.find(@admin_membership.pluck(:user_id).join(""))

        @followers = @club.followers(User)

        @shelf = @club.shelf
        @current_book = Book.find(@shelf.current_book) if @shelf.current_book
        @upcoming_books = @shelf.upcoming_books.map { |book| Book.find(book) }
        @read_books = @shelf.read_books.map { |book| Book.find(book) }
    end

    def edit
        membership = @club.memberships.find_by_user_id(current_user.id)
        if membership.admin = true
            render 'edit'
        else
            flash[:danger] = "You are not an admin of this club."
            redirect_to @club
        end
    end

    def update
        if @club.update!(club_params)
            flash[:success] = "The club is successfully edited."
            redirect_to @club
        else
            flash[:danger] = "The club could not be updated."
            render 'edit'
        end
    end

    def destroy
        @club.destroy
        redirect_to memberships_path
    end
 
    private

    def set_club
        @club = Club.friendly.find(params[:id])
    end

    def club_params
        params.require(:club).permit(:name, :genre, :subgenre, :description, :club_image, :cover_image)
    end

end

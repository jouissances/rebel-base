class ClubsController < ApplicationController

    before_action :set_user, except: [:index, :show]

    def index
        @clubs = Club.all
    end

    def new
        @club = Club.new
    end

    def create
        @club = Club.create(club_params)

        if @club.save
            @shelf = Shelf.create(:club_id => @club.id)
            @membership = Membership.create(:user_id => current_user.id, :club_id => @club.id)
            current_user.follow!(@club)
            membership = @club.memberships.find_by_user_id(current_user.id)
            membership.admin = true
            membership.save!
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
        @club = Club.find(params[:id])
        @shelf = @club.shelf
        @current_book = Book.find(@shelf.current_book) if @shelf.current_book
        @upcoming_books = @shelf.upcoming_books.map { |book| Book.find(book) }
        @read_books = @shelf.read_books.map { |book| Book.find(book) }
    end

    def edit
        @club = Club.find(params[:id])
        membership = @club.memberships.find_by_user_id(current_user.id)
        if membership.admin = true
            render 'edit'
        else
            flash[:danger] = "You are not an admin of this club."
            redirect_to @club
        end
    end

    def update
        @club = Club.find(params[:id])
        if @club.update!(club_params)
            flash[:success] = "The club is successfully edited."
            redirect_to @club
        else
            flash[:danger] = "The club could not be updated."
            render 'edit'
        end
    end

    def destroy
        @club = Club.find(params[:id]).destroy
        redirect_to memberships_path
    end
 
    private

    def club_params
        params.require(:club).permit(:name, :genre, :subgenre, :description, :club_image, :cover_image)
    end

    def set_user
        @user = current_user
    end

end

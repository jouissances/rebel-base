class DiscussionsController < ApplicationController
    before_action :authenticate_user!

    def create
        @book = Book.friendly.find(params[:book_id])
        @discussion = @book.discussions.create(discussion_params)
        @discussion.user_id = current_user.id
        
        if @discussion.save
            redirect_to club_shelf_book_path(:id => params[:book_id])
            flash[:success] = "Discussion posted."
        else
            redirect_to club_shelf_book_path(:id => params[:book_id])
            flash[:danger] = "Something went wrong while posting your discussion. Please try again."
        end
    end

    def edit
        @club = Club.friendly.find(params[:club_id])
        @book = Book.friendly.find(params[:book_id])
        @shelf = Shelf.find(params[:shelf_id])
        @discussion = Discussion.find(params[:discussion_id])
    end

    def update
        @discussion = Discussion.find(params[:id])
        if @discussion.update!(discussion_params)
            flash[:success] = "The discussion is successfully edited."
            redirect_to club_shelf_book_path(:id => params[:book_id])
        else
            flash[:danger] = "The discussion could not be updated."
            render 'edit'
        end
    end

    def destroy
        @discussion = Discussion.find(params[:discussion_id])
        if @discussion.user == current_user
            flash[:warning] = "You have deleted your discussion."
            @discussion.destroy
        else
            flash[:danger] = "You do not have permission to delete this discussion."
        end
        redirect_to club_shelf_book_path(:id => params[:book_id])
    end

    private

    def discussion_params
        params.require(:discussion).permit(:title, :body, :book_quote)
    end

end

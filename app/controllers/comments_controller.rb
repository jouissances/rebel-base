class CommentsController < ApplicationController
    
    before_action :authenticate_user!

    def create
        @discussion = Discussion.find(params[:discussion_id])
        @comment = @discussion.comments.create(comment_params)
        @comment.user_id = current_user.id
        
        if @comment.save
            flash[:success] = "Your comment was posted."
            redirect_to club_shelf_book_path(:id => params[:book_id])
        else
            flash[:danger] = "Something went wrong and we could not save your comment. Please try again."
            redirect_to club_shelf_book_path(:id => params[:book_id])
        end
    end

    def destroy
        @comment = Comment.find(params[:comment_id])
        if @comment.user == current_user
            @comment.destroy
            flash[:warning] = "You have deleted your comment."
        else
            flash[:danger] = "You do not have permission to delete this comment."
        end
        redirect_to club_shelf_book_path(:id => params[:book_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

end

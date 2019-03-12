class CommentsController < ApplicationController
    
    respond_to :html, :js

    before_action :authenticate_user!

    def index
        @comments = Comment.all
        @discussion = Discussion.find(params[:discussion_id])

        respond_to do |format|
            format.json { render :json => @comments }
        end
    end
    
    def create
        @club = Club.friendly.find(params[:club_id])
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

    def show
        @comment = Comment.find(params[:id])

        respond_to do |format|
            format.json { render :json => @comment }
        end
    end

    def destroy
        # {:action=>"destroy", :book_id=>"the-three-body-problem", :club_id=>nil, :comment_id=>89, :controller=>"comments", :discussion_id=>1, :shelf_id=>"1"}, possible unmatched constraints: [:club_id]):
        @club = Club.friendly.find(params[:club_id])
        @comment = Comment.find(params[:comment_id])
        if @comment.user == current_user
            @comment.destroy
            flash[:warning] = "You have deleted your comment."
        else
            flash[:danger] = "You do not have permission to delete this comment."
        end
        redirect_to club_shelf_book_discussions_path(:id => params[:book_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

end

class DiscussionsController < ApplicationController
    
    before_action :authenticate_user!

    def index
        @book = Book.friendly.find(params[:book_id])
        @discussions = @book.discussions
        @discussion = Discussion.new

        @club = Club.friendly.find(params[:club_id])
        # @discussion = Discussion.find(params[:discussion_id])
        @shelf = Shelf.find(params[:shelf_id])
        @current_book = @shelf.current_book

        @comment = Comment.new

        respond_to do |format|
            format.html { render :index }
            format.json { render :json => @discussions }
        end
    end

    def create
        @club = Club.friendly.find(params[:club_id])
        @shelf = Shelf.find(params[:shelf_id])
        @book = Book.friendly.find(params[:book_id])
        @discussion = @book.discussions.create(discussion_params)
        @discussion.user_id = current_user.id
        
        if @discussion.save
            redirect_to club_shelf_book_discussions_path
            flash[:success] = "Discussion posted."
        else
            redirect_to club_shelf_book_discussions_path
            flash[:danger] = "Something went wrong while posting your discussion. Please try again."
        end
    end

    def show
        @discussion = Discussion.find(params[:id])

        respond_to do |format|
            format.json { render :json => @discussion }
        end
    end

    def edit
        @club = Club.friendly.find(params[:club_id])
        @book = Book.friendly.find(params[:book_id])
        @shelf = Shelf.find(params[:shelf_id])
        @discussion = Discussion.find(params[:id])
    end

    def update
        @discussion = Discussion.find(params[:id])
        if @discussion.update!(discussion_params)
            flash[:success] = "The discussion is successfully edited."
            redirect_to club_shelf_book_discussions_path
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
        redirect_to club_shelf_book_discussions_path
    end

    private

    def discussion_params
        params.require(:discussion).permit(:title, :body, :book_quote)
    end

end

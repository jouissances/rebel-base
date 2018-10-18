class ShelvesController < ApplicationController

    def new
        @shelf = Shelf.new
    end

    def show
        @shelf = Shelf.find(params[:id])
        @current_book = Book.find(@shelf.current_book) if @shelf.current_book
        @upcoming_books = @shelf.upcoming_books.map { |book| Book.find(book) }
        @read_books = @shelf.read_books.map { |book| Book.find(book) }
    end

    private

    def shelf_params
        params.require(:shelf).permit(:current_book, :read_books, :upcoming_books)
    end

end

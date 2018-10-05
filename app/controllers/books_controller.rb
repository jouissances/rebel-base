class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:index, :home]
end

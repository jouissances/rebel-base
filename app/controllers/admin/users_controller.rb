class Admin::UsersController < ApplicationController

    def show
        @user = User.friendly.find(params[:id])
        @clubs = @user.followees(Club)
        @quote_hash = Libri::Scraper.new.scrape_quote.sample
        @quote = @quote_hash.quote
        @author = @quote_hash.author
    end

    def edit
        @user = User.friendly.find(params[:id])
    end

    def update
        @user = User.friendly.find(params[:id])
        @user.update(admin_user_params)
        redirect_to admin_user_path(@user)
    end

    private

    def admin_user_params
        params.require(:user).permit(:image, :username, :first_name, :last_name, :location, :bio, :gender, :location, :twitter, :facebook, :instagram, :slack)
    end

end
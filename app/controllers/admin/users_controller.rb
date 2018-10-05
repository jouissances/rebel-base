class Admin::UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(admin_user_params)
        redirect_to admin_user_path(@user)
    end

    private

    def admin_user_params
        params.require(:user).permit(:first_name, :last_name, :location, :bio, :gender, :location, :twitter, :facebook, :instagram)
    end

end
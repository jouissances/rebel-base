class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth
            @user = User.create_with_omniauth(auth)
            session[:user_id] = @user.id
            render 'users/show'
        else
            @user = User.find_by_email(params[:user][:email])
            @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            render 'users/show'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
    
    private
    
    def auth
        request.env['omniauth.auth']
    end

end

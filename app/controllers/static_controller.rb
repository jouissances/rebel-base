class StaticController < ApplicationController

    def index
        @clubs = Club.all
        @discussions = Discussion.all

        @user = current_user
    end
    
end

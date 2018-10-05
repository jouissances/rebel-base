class StaticController < ApplicationController

    def index
        @clubs = Club.all
        @discussions = Discussion.all
    end
    
end

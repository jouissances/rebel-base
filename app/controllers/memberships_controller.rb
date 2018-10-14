class MembershipsController < ApplicationController

    # before_action :set_club
    before_action :set_user

    def index
        @clubs = @user.followees(Club)
    end

    def new
        @club = Club.find(params[:club_id])
        if @user.follows?(@club) == true
            flash[:notice] = "You have already joined #{@club.name}."
            redirect_to memberships_path
        else
            @membership = Membership.create(:user_id => params[:user_id], :club_id => params[:club_id])
            @club.users << @user
            @user.follow!(@club)
            flash[:success] = "You have successfully joined #{@club.name}."
            redirect_to memberships_path
        end
    end

    def update
        @club = Club.find(params[:id])
        @user.follow!(@club)
        redirect_to club_path(@club)
    end

    def destroy
        @club = Club.find(params[:id])
        @user.unfollow!(@club)
        redirect_to club_path(@club)
    end

    private

    def set_club
        @club = Club.find(params[:club_id])
    end

    def set_user
        @user = current_user
    end

end

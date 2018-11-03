class MembershipsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_user

    def index
        @clubs = @user.followees(Club)
        @genres = @clubs.map { |club| club.genre }.uniq
    end

    def new
        @club = Club.friendly.find(params[:club_id])
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
        @club = Club.friendly.find(params[:id])
        @user.follow!(@club)
        respond_to do |format|
            format.js { render inline: "location.reload();" }
        end
    end

    def destroy
        @club = Club.friendly.find(params[:id])
        @user.unfollow!(@club)
        respond_to do |format|
            format.js { render inline: "location.reload();" }
        end 
    end

    private

    def set_user
        @user = current_user
    end

end

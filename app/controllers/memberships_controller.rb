class MembershipsController < ApplicationController

    def new
        @membership = Membership.create(:user_id => params[:user_id], :club_id => params[:club_id])
        @club << @user
        # @message = @membership.new_member
        # redirect_to user_path(@club.user, :message => @message)
    end

end

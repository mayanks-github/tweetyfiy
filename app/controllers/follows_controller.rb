class FollowsController < ApplicationController
    def create
      @follow = Follow.create(follower_id: current_user.id, following_id: params[:id])
  
      if @follow.save
        redirect_to root_path, notice: 'You are now following this user.'
      else
        redirect_to root_path, alert: 'Failed to follow this user.'
      end
    end
  
    def destroy
      @follow = Follow.find_by(follower_id: current_user.id, following_id: params[:id])
  
      if @follow
        @follow.destroy
        redirect_to root_path, notice: 'You have unfollowed this user.'
      else
        redirect_to root_path, alert: 'Failed to unfollow this user.'
      end
    end
  end
  
class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.where(user_id: [current_user.followings.pluck(:id), current_user.id].flatten.uniq)
    .eager_load(user: :profile)
    .order(created_at: :desc)
    @users_to_follow = User.where.not(id: current_user.followings.pluck(:id)).eager_load(:profile)
  end
end

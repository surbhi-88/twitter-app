class FollowsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_follow, only: [:unfollow]

  #POST   /follows/follow
  def follow
    @follow = Follow.new(follow_params.merge({ user_id: current_user.id}))
    if @follow.save
      render json: { message: "Successfully Followed"}, status: 200
    else
      render json: { error: @follow.errors.full_messages }, status: 422
    end
  end

  #DELETE /follows/unfollow
  def unfollow
    @follow.destroy
    render json: { message: "Successfully Unfollowed."}, status: 200
  end

  private 

    def set_follow
      @follow = Follow.find_by(followed_user_id: params[:followed_user_id], user_id: current_user.id)
      render json: { message: "Follow Not Found"} unless @follow and return
    end

    def follow_params
      params.require(:follow).permit(:followed_user_id)
    end
end

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:like][:post_id] )
    @like.save
    redirect_to posts_path
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.user_id = current_user.id
      @like.destroy
    end
    redirect_to posts_path
  end
end

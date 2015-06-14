class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:like][:post_id] )
    @like.save
    redirect_to posts_path
  end
end

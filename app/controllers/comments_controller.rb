class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    if @post
      @post.comments.create(text: params[:comment][:text], user: current_user)
    end
    redirect_to posts_path
  end
end

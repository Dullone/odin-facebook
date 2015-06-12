class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
    else
      flash[:alert] = "Post error: " + post.errors.full_messages.join(", ")
    end
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:text)
    end

end

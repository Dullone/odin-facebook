class PostsController < ApplicationController
  before_action :authenticate_user!
  include PostsHelper

  def index
    @posts = feed(current_user)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      flash[:notice] = "Post success!"
    else
      flash[:alert] = "Post error: " + post.errors.full_messages.join(", ")
    end
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:text)
    end

end

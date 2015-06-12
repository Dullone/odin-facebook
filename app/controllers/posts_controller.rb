class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def new
    @post = Post.new
  end

  def create
    if @post = current_user.posts.create(post_params)
      flash[:notice] = "Post created!"
      redirect_to root_path
    else
      render :new
    end

  end

  private

    def post_params
      params.require(:post).permit(:text)
    end

end

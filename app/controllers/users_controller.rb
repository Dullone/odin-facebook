class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 20)
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id && 
                      @user.update_attributes(user_edit_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

    def user_edit_params
      params.require(:user).permit(:location, :interests, :job)
    end

end

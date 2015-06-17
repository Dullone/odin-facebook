class FriendLinksController < ApplicationController
  before_action :authenticate_user!
  include FriendLinksHelper

  def create
    friend_id = (params[:friend_link][:friend_id]).to_i
    @friend = User.find(friend_id)
    if @friend && !current_user.friends.include?(@friend)
      current_user.friend_links.create(requested_id: friend_id,
                                        status: "pending")
      redirect_to root_path
    end
  end

  def update
    @friend_link = FriendLink.find(params[:id])
    @friend_link.update_attributes(status: 'accepted')
    redirect_to friend_links_path
  end

  def index
    @friend_links = unaswered_friend_requests
    @friends = current_user.friends
  end

  def destroy
    @friend_link = FriendLink.find(params[:id])
    if @friend_link.user == current_user
      @friend_link.destroy
    end
    render :index
  end
end

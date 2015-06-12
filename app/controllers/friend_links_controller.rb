class FriendLinksController < ApplicationController
  before_action :authenticate_user!

  def create
    friend_id = (params[:friend_link][:friend_id]).to_i
    @friend = User.find(friend_id)
    if @friend
      current_user.friend_links.create(friend_id: friend_id,
                                        status: "pending")
      redirect_to root_path
    end
  end

end

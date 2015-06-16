module FriendLinksHelper
  def unaswered_friend_requests?
    friend_reqests = FriendLink.where(status: "pending", friend_id: current_user.id)
    friend_reqests.count > 0 
  end

  def unaswered_friend_requests
    friend_reqests = FriendLink.where(status: "pending", friend_id: current_user.id)
  end

  def friends_list
    friend_reqests = FriendLink.where(status: "accepted", friend_id: current_user.id)
  end
end

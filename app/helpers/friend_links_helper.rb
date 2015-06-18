module FriendLinksHelper
  def unaswered_friend_requests?
    #friend_reqests = FriendLink.where(status: "pending", friend_id: current_user.id)
    unaswered_friend_requests.count > 0 
  end

  def unaswered_friend_requests
    friend_reqests = FriendLink.where("status = ? AND (requested_id = ?)", 
                                               "pending", current_user.id)
  end

  def pending_friend_requests?(user_id)
    FriendLink.where("status = ? AND (requested_id = ? OR requester_id = ? )", 
                                        "pending", user_id, user_id).count > 0
  end
  def pending_friend_requests(user_id)
    FriendLink.where("status = ? AND (requested_id = ? OR requester_id = ? )", 
                                        "pending", user_id, user_id)
  end
end

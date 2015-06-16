module PostsHelper
  def feed
    friends = current_user.friends.where("status = ?", "accepted").pluck(:id)
    friends << current_user.id
    Post.where("user_id in (?)", friends)
  end
end

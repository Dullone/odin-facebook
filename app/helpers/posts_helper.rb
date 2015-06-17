module PostsHelper
  def feed (user)
    friends = user.friends.where("status = ?", "accepted").pluck(:id)
    friends << user.id
    Post.where("user_id in (?)", friends)
  end
end

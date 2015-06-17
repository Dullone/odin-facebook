module PostsHelper
  def feed (user)
    friends = user.friends.map {|f| f.id }
    friends << user.id
    Post.where("user_id in (?)", friends)
  end
end

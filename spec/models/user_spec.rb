require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2){ FactoryGirl.create(:user) }
  let(:user3){ FactoryGirl.create(:user) }
  let(:post) { Post.create(text: "Post body", user: user) }


  it "gets associated posts" do 
    expect(user.posts).to include(post)
  end

  it "doesn't get non-associated posts" do 
    post2 = Post.create(text: "Post from user 2", user: user2)
    expect(user.posts).to_not include(post2)
  end

 describe "friended" do

    it "can have friends from requesting" do 
      FriendLink.create(friend: user2, user: user, status: "accepted")
      expect(user.friended).to include(user2)
    end

    it "can have friends from  accepting" do 
      FriendLink.create(friend: user, user: user2, status: "accepted")
      expect(user.friended).to include(user2)
    end

    it "doesn't include pending friend_links" do 
      FriendLink.create(friend: user3, user: user, status: "pending")
      expect(user.friended).to_not include(user3)
    end
  end

end

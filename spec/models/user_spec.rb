require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2){ FactoryGirl.create(:user) }
  let(:post) { Post.create(text: "Post body", user: user) }


  it "gets associated posts" do 
    expect(user.posts).to include(post)
  end

  it "doesn't get non-associated posts" do 
    post2 = Post.create(text: "Post from user 2", user: user2)
    expect(user.posts).to_not include(post2)
  end

 describe "friends" do
    before do 
      FriendLink.create(friend: user2, user: user, status: "accepted")
    end

    it "can have friends" do 
      expect(user.friends).to include(user2)
    end
  end

end

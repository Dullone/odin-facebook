require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { Post.create(text: "Post body", user: user) }


  it "gets associated posts" do 
    expect(user.posts).to include(post)
  end

 describe "friends" do
    let(:user2){ FactoryGirl.create(:user) }
    before do 
      @friend = FriendLink.new(friend: user2, user: user, status: "accepted")
      @friend.save
    end

    it "should have friend" do 
      expect(user.friends).to include(user2)
    end
  end
end

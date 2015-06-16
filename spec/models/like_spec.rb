require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { Post.create(text: "Post body", user: user) }
  let(:like) { Like.create(user: user, post: post) }

  it "has a post" do 
    expect(like.post).to eql post
  end

  it "has a user" do 
    expect(like.user).to eql user
  end

  it "doesn't let a user like a post twice" do 
    like = Like.create(user: user, post: post)
    like2 = Like.new(user: user, post: post)
    expect(like2.save).to eql false
  end
end

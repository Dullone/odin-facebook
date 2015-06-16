require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { Post.create(text: "Post body", user: user) }
  let(:like) { Like.create(user:user, post: post) }

  it "has a user" do 
    expect(like.post).to eql post
  end

  it "has a post" do 
    expect(like.user).to eql user
  end
end

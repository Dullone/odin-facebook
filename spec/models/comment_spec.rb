require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user)    { FactoryGirl.create(:user) }
  let(:post)    { Post.create(text: "Post body", user: user) }
  let(:comment) { Comment.create(text: "comment body", user: user, 
                                  post: post)}

  it "has a user" do 
    expect(comment.post).to eql post
  end

  it "has a post" do 
    expect(comment.user).to eql user
  end

end

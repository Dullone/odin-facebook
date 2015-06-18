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

  it "cannot have a comment longer that 5000" do
    comment = Comment.new(text: "c"*5001, user: user, 
                                  post: post)
    expect(comment.save).to eql false
  end

end

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user)  }
  let(:post) { Post.create(text: "Post body", user: user)}
  #let(:friend){ FriendLink.create() }

  it "gets associated posts" do 
    expect(user.posts).to include(post)
  end

  it "gets friends" do
    
  end
end

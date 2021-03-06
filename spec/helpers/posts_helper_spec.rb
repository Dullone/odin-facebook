require 'rails_helper'
include PostsHelper
RSpec.describe CommentsHelper, type: :helper do
  let(:user)    { FactoryGirl.create(:user) }
  let(:user2)   { FactoryGirl.create(:user) }
  let(:post1)   { user.posts.create(text: "User 1 post") }
  let(:post2)   { user2.posts.create(text: "User 2 post") }

  it "gets a feed with posts from friends" do
    user.friend_links.create(requester_id: user.id, requested_id: user2.id, status: "accepted")
    expect(feed(user)).to include(post2)
    expect(feed(user2)).to include(post1)
  end

  it "doesn't show non-friends posts" do 
    expect(feed(user)).to_not include(post2)
  end
end

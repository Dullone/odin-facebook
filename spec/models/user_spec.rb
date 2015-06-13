require 'rails_helper'

RSpec.describe User, type: :model do
    before { @user = User.new(email: "Ruby@example.com", name: "Ruby",
                            password: "password", password_confirmation: "password")}
  subject { @user }

  let(:user) { build(:user) }
  let(:post) { Post.create(text: "Post body", user: user) }

  it "gets associated posts" do 
    expect(user.posts).to include(post)
  end

 describe "friends" do
    let(:user2){ FactoryGirl.create(:user) }
    before do 
      @user.save
      @friend = FriendLink.new(friend: user2, user: @user, status: "accepted")
      @friend.save
    end

    its(:friends){ should include(user2) }
  end
end

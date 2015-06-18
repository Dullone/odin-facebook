require 'rails_helper'

RSpec.describe FriendLinksHelper, type: :helper do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2){ FactoryGirl.create(:user) }
  let(:user3){ FactoryGirl.create(:user) }
  let(:friend_link_1_to_3) { friend_link = FriendLink.create(
                          requested_id: user3.id, 
                          requester_id: user.id, status: "pending") }
  let(:friend_link_3_to_1) { friend_link = FriendLink.create(
                            requested_id: user.id, 
                            requester_id: user3.id, status: "pending") }

  describe "pending friend links" do 
    it "gets pending friend request" do 
      expect(pending_friend_requests(user)).to include(friend_link_1_to_3)
    end

    it "gets sent friend request that have not been answered" do 
      expect(pending_friend_requests(user)).to include(friend_link_3_to_1)
    end

    it "doesn't get requests of other users" do 
      friend_link_3_to_1
      expect(pending_friend_requests(user2)).to_not include(friend_link_3_to_1)
    end

    it "identifies a pending friend link" do 
      friend_link_1_to_3
      expect(pending_friend_requests?(user)).to eql true
    end


  end

end
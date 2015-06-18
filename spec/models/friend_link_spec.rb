require 'rails_helper'

RSpec.describe FriendLink, type: :model do
  let(:user1) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  let(:friend_link_1_to_2) { friend_link = FriendLink.new(
                          requested_id: user2.id, 
                          requester_id: user1.id) }
  let(:friend_link_2_to_1) { friend_link = FriendLink.new(
                          requested_id: user2.id, 
                          requester_id: user1.id) }

  describe "creation" do 
    it "status can have pending or accepted" do 
      friend_link_1_to_2.status = "pending"
      expect(friend_link_1_to_2.save).to eql true
    end

    it "cannot create the same friend link between two users twice" do
      friend_link_1_to_2.status = "pending"
      expect(friend_link_1_to_2.save).to eql true
      friend_link_2_to_1.status = "accepted"
      expect(friend_link_2_to_1.save).to eql false
    end

    it "status cannot be something other than pending or accepted" do 
      friend_link_1_to_2.status = "duck"
      expect(friend_link_1_to_2.save).to eql false
      friend_link_2_to_1.status = "goose"
      expect(friend_link_2_to_1.save).to eql false
    end

    it "validates presense of requester and requested id" do 
      friend_link_1_to_2.requested_id = nil
      expect(friend_link_1_to_2.save).to eql false
      friend_link_2_to_1.requester_id = nil
      expect(friend_link_2_to_1.save).to eql false
    end
  end
end

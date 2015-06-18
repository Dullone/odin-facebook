require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user)          { FactoryGirl.create(:user) }
  let(:invalid_post)  { FactoryGirl.create(:post) }
  let(:post)          { FactoryGirl.build(:post) }

  def create_valid_post
    post.user = user
    post
  end

  def saved_valid_post
    post = create_valid_post
    post.save
    post
  end

  describe "creation" do
    it "doesn't allow an nil user" do 
      expect { invalid_post.save }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "doesn't allow blank text" do 
      expect{ invalid_post.text = nil }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "doesn't allow 5001 letter post" do 
      post.user = user
      post.text = "a" * 5001
      expect(post.save).to eql false
    end

    it "allows a valid post" do 
      expect(create_valid_post.save).to eql true
    end
  end

  describe "likes" do 
    it "has likes" do
      valid_post = saved_valid_post
      like = valid_post.likes.create(user: user)
      expect(valid_post.likes).to include(like)
      expect(valid_post.user_likes).to include(user)
    end
  end

  describe "comments" do 
    it "has comments" do 
      valid_post = saved_valid_post
      comment = valid_post.comments.create(user: user, text: "cool post")
      expect(valid_post.comments).to include(comment)
    end
  end
end
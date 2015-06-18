require 'rails_helper'

RSpec.describe "UserSessions", type: :request do
  describe "redirect if not logged in" do 
    it "root_path" do 
      get root_path
      assert_redirected_to new_user_session_path
    end

    it "users_path" do 
      get users_path
      assert_redirected_to new_user_session_path
    end

    it "posts_path" do 
      get posts_path
      assert_redirected_to new_user_session_path
    end

    it "friend_links_path" do 
      get friend_links_path
      assert_redirected_to new_user_session_path
    end
    it "post likes_path" do 
      post likes_path
      assert_redirected_to new_user_session_path
    end
  end
  
end

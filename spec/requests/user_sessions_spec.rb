require 'rails_helper'

RSpec.describe "UserSessions", type: :request do
  describe "GET /user_sessions" do
    it "works! (now write some real specs)" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe "root path" do 
    it "shows login page if user not logged in" do 
      get root_path
      assert_redirected_to new_user_session_path
    end
  end

end

require 'rails_helper'

RSpec.feature "SiteLayouts", type: :feature do
  describe "logged in" do 
    let(:user){ FactoryGirl.create(:user) }
   #before do 
   #  post user_session_path, { user: { email: user.email, password: user.password } }
   #end

    it "shows logout when logged in" do 
      visit new_user_session_path
      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => user.password
      click_button("Log in")

      expect(page).to have_link("logout", '/user/sign_out')
    end
  end
end

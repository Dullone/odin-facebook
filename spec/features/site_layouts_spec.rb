require 'rails_helper'

RSpec.feature "SiteLayouts", type: :feature do
  let(:user){ FactoryGirl.create(:user) }

  def log_in
    visit new_user_session_path
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    click_button("Log in")
  end

  describe "logged in" do 
    before(:example) { log_in }
    it "shows logout when logged in" do 
      expect(page).to have_link("logout", '/user/sign_out')
    end
    it "shows user name" do
      expect(page).to have_content("#{user.name}")
    end
  end

  describe "page elements" do 
    before(:example) { log_in }
    it "has a header" do 
      find(".header")
    end
    it "has a footer" do 
      find(".footer")
    end
    it "has content" do 
      find(".content-container")
    end
  end

  describe "pages" do 
    before(:example) { log_in }
    it "has a profile page" do 
      visit user_path(user)
      find(".profile")
    end
    it "has posts" do 
      visit posts_path
      find(".new_post")
      text = "Post text 332"
      fill_in "post_text", with: text
      click_button "post"
      expect(page).to have_content(text)
    end
    it "has friends" do 
      visit friend_links_path
      find(".friends")
    end
    it "has people" do 
      visit users_path
      find(".user")
    end
  end
end

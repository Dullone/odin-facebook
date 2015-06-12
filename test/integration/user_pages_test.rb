require 'test_helper'

class UserPagesTest < ActionDispatch::IntegrationTest
  def setup
    post_via_redirect 'users/sign_in'
  end

  test "only signup shows if not logged in" do 
    get root_path
    assert_redirected_to '/users/sign_in'
  end

  test "new post shows up on homepage" do
    post_via_redirect 'users/sign_in', 'user[email]' => 'Ruby',
                                     'user[password]' => 'password'
    get root_path
    assert_select 'new_post', 1
  end
end

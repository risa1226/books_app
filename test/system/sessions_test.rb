require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase

  # test "visiting the index" do
  #   visit sessions_url
  #
  #   assert_selector "h1", text: "Sessions"
  # end

  def setup 
    @user = users(:user1)
  end

  test "login" do
    visit user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: "password"
    click_on 'Log in'
    assert_text 'ログインしました'
    click_on 'ログアウト'
    assert_text 'ログアウトしました'
  end
end

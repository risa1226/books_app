# frozen_string_literal: true

require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit users_url
  #
  #   assert_selector "h1", text: "Users"
  # end
  setup do
    @user = users(:user1)
    login_as(@user)
  end

  test "editing a User" do
    visit edit_user_registration_path
    fill_in "パスワード", with: "newpassword"
    fill_in "パスワード（確認用）", with: "newpassword"
    fill_in "現在のパスワード", with: "password"
    click_on "Update"
    assert_text "アカウント情報を変更しました"
  end
end

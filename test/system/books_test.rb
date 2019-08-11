# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book1)
    @user = users(:user1)
    login_as(@user)
  end

  test "visiting the index" do
    visit books_path
    assert_selector "h1", text: "図書"
  end

  test "creating a Book" do
    visit books_path
    click_on "新規作成"
    fill_in "タイトル", with: @book.title
    fill_in "メモ", with: @book.memo
    click_on "登録する"
    assert_text "書籍を追加しました"
    click_on "戻る"
  end

  test "updating a Book" do
    visit books_path
    click_on "編集"
    fill_in "メモ", with: @book.memo
    fill_in "タイトル", with: @book.title
    click_on "更新する"
    assert_text "書籍を更新しました"
    click_on "戻る"
  end

  test "destroying a Book" do
    visit books_path
    page.accept_confirm do
      click_on "削除"
    end
    assert_text "書籍を削除しました"
  end
end

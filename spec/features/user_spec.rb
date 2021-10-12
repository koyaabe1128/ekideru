require "rails_helper"

feature "User", type: :feature do
  feature "ユーザー登録前" do
    scenario 'ユーザー登録ができるか' do
      visit root_path
      click_link "新規登録"
      fill_in "user[name]", with: "太郎"
      fill_in "user[email]", with: "sample@sample.com"
      fill_in "user[password]", with: "User1234"
      fill_in "user[password_confirmation]", with: "User1234"
      click_button "登録する"
      expect(page).to have_content("何から探しますか？")
    end

    # scenario 'ログインできないか' do
    #   visit root_path
    #   click_on "Log in"
    #   fill_in "メールアドレス", with: "bbb@gmail.com"
    #   fill_in "パスワード", with: "1111111"
    #   click_on "ログインする"
    #   expect(page).to have_content "メールアドレスまたはパスワードが違います"
    # end
  end
end
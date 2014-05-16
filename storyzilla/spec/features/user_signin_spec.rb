require 'spec_helper'

feature "User signs in" do
  user = FactoryGirl.create(:user, username: "Bob", email: "bob@bob.com", password: "password", password_confirmation: "password")
  scenario "with valid username and password" do
    visit '/'
    click_link "Sign In"
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content "Sign in successful!"
  end

  scenario "can't with invalid username and email" do
    visit '/'
    click_link "Sign In"
    fill_in "Username", with: "Bob"
    fill_in "Password", with: "pass"
    click_button "Sign In"
    expect(page).to have_content "Wrong username or password!"
  end
end

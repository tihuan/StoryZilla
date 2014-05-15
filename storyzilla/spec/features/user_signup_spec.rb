require 'spec_helper'

feature "User can sign up" do
  user = FactoryGirl.create(:user, username: "Bob", email: "bob@bob.com", password: "password", password_confirmation: "password")
  scenario "with valid attributes" do
    visit '/'
    click_link "Sign Up"
    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password_confirmation
    click_button "Sign Up"

    expect(page).to have_content "You have signed up successfully."
  end

  scenario "with invalid attributes" do
    visit '/'
    click_link "Sign Up"
    fill_in "Username", with: ""
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign Up"

    expect(page).to have_content "User couldn't be saved."
  end
end

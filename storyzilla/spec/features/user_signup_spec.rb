require 'spec_helper'

feature "User can sign up" do
  user = User.new(username: "some_user45", email: "some_user45@gmail.com", password: 'password', password_confirmation: 'password')
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
end

feature "Prevent users from signing up with invalid attributes" do
  let!(:user) { FactoryGirl.create(:user) }
  scenario "all attributes blank" do
    visit '/'
    click_link "Sign Up"
    fill_in "Username", with: ""
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign Up"

    expect(page).to have_content "User couldn't be saved."
    expect(page).to have_content "Email can't be blank"
  end

  scenario "username already taken" do
    visit '/'
    click_link "Sign Up"
    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password_confirmation
    click_button "Sign Up"

    expect(page).to have_content "User couldn't be saved."
    expect(page).to have_content "Username has already been taken"
  end
end

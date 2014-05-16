require 'spec_helper'

feature "User signs in" do
  let(:user) { FactoryGirl.create(:user) }
  scenario "with valid username and password" do
    visit '/'
    click_link "Sign In"
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content "Sign in successful!"
  end

  scenario "with invalid username and email" do
    visit '/'
    click_link "Sign In"
    fill_in "Username", with: "Bob"
    fill_in "Password", with: "pass"
    click_button "Sign In"
    expect(page).to have_content "Wrong username or password!"
  end
end

feature "Log out" do
  let(:user) { FactoryGirl.create(:user) }
  scenario "logging out" do
    visit '/'

    click_link "Sign In"
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"

    click_link "Log Out"

    expect(page).to have_link "Sign In"
  end
end

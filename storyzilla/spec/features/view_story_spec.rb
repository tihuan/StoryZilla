require 'spec_helper'

feature "View a story" do
  let!(:story) { FactoryGirl.create(:story) }
  let(:user) { FactoryGirl.create(:user) }
  scenario "when not logged in" do
    visit stories_path

    expect(page).to have_content "Please sign in."
  end

  scenario "when logged in" do
    visit signin_url
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit stories_path

    click_link "My Story"

    expect(page).to have_content "My Story"
  end
end

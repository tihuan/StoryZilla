require 'spec_helper'

feature "Create a story" do
  let!(:user) { FactoryGirl.create(:user, username: "someuser", email: "email@email.com", password: "password", password_confirmation: "password") }

  let!(:story) { FactoryGirl.create(:story, title: "Great story", beginning: "A new beginning") }

  scenario "with valid attributes" do
    visit new_story_path(story)

    fill_in "Title", with: story.title

    fill_in "Beginning", with: story.beginning
    click_button "Submit"

    expect(page).to have_content story.title
    expect(page).to have_content story.beginning
  end

  scenario "with invalid title" do
    visit new_story_path(story)

    fill_in "Title", with: ""

    fill_in "Beginning", with: story.beginning
    click_button "Submit"
    expect(page).to have_content "Story was not created."
  end

  scenario "with invalid beginning" do
    visit new_story_path(story)

    fill_in "Title", with: story.title

    fill_in "Beginning", with: ""
    click_button "Submit"
    expect(page).to have_content "Story was not created."
  end

end


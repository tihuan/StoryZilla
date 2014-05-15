require 'spec_helper'

feature "Create a story" do
  let!(:user) { FactoryGirl.create(:user, username: "someuser", email: "email@email.com", password: "password", password_confirmation: "password") }

  let!(:story) { FactoryGirl.create(:story, title: "Great story", beginning: "A new beginning") }
  # story = FactoryGirl.create()
  scenario "with valid attributes" do
    visit new_story_path(story)
    # click_link "Create story" # I commented this out because we are actually starting on the page with the form, not going to it via a link

    fill_in "Title", with: story.title

    fill_in "Beginning", with: story.beginning
    click_button "Submit"

    expect(page).to have_content story.title
    expect(page).to have_content story.beginning
  end

  scenario "with invalid title" do
    visit new_story_path(story)
    # click_link "Create story"

    fill_in "Title", with: ""

    fill_in "Beginning", with: story.beginning
    click_button "Submit"
    expect(page).to_not have_content story.beginning
  end

  scenario "with invalid beginning" do
    visit new_story_path(story)
    # click_link "Create story"

    fill_in "Title", with: "Once upon a time"

    fill_in "Beginning", with: ""
    click_button "Submit"
    expect(page).to_not have_content "Once upon a time"
  end

end


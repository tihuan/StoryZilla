require 'spec_helper'

feature "Create a story" do
  let(:user) { FactoryGirl.create(:user) }

  let(:story) { FactoryGirl.create(:story, title: "Great story", beginning: "A new beginning") }

  before do
    visit signin_url
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
  end

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
    expect(page).to have_content "Title can't be blank"
  end

  scenario "with invalid beginning" do
    visit new_story_path(story)

    fill_in "Title", with: story.title

    fill_in "Beginning", with: ""
    click_button "Submit"
    expect(page).to have_content "Story was not created."
    expect(page).to have_content "Beginning can't be blank"
  end

end


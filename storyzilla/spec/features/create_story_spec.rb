require 'spec_helper'

feature "Create a story" do
  let(:story) { FactoryGirl.create(:story, title: "Great story", beginning: "A new beginning") }
  # story = FactoryGirl.create()
  scenario "with valid attributes" do
    visit root_path
    click_link "Create story"

    fill_in "Title", with: story.title

    fill_in "Beginning", with: story.beginning
    click_button "Submit"

    expect(page).to have_content story.title
    expect(page).to have_content story.beginning
  end

  scenario "with invalid title" do
    it "blank title" do
      visit root_path
      click_link "Create story"

      fill_in "Title", with: nil

      fill_in "Beginning", with: story.beginning
      click_button "Submit"
      expect(page).to have_content "Story must have a title."
    end
  end

  scenario "with invalid beginning" do
    it "blank beginning" do
      visit root_path
      click_link "Create story"

      fill_in "Title", with: "Once upon a time"

      fill_in "Beginning", with: nil
      click_button "Submit"
      expect(page).to have_content "Beginning of story cannot be blank."
    end
  end

end


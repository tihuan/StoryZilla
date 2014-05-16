require 'spec_helper'

feature "Create a contributio" do
  let(:user) { FactoryGirl.create(:user) }

  let(:story) { FactoryGirl.create(:story, title: "Great story", beginning: "A new beginning") }

  describe "View all contributions on finished stories" do

    it "shows the contributions on a finished story" do
    end

  end
  describe "View last contribution of unfinished story" do

    it "shows the last contribution of an unfinished story" do
    end

  end
  describe "add contribution to unfinished story" do

    context "while logged in" do

      it "creates a contribution to the story" do
      end

    end

    context "while not logged in" do

      it "redirects and tells you to log in" do
      end

    end
  end
end




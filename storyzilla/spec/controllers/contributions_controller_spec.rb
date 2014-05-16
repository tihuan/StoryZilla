require 'spec_helper'

describe ContributionsController do
  let!(:user) { FactoryGirl.create(:user) }


  describe "#index" do
    before { session[:user_id] = user.id }
    it "sets instance variable with all incomplete stories" do
      get :index
      expect(assigns(:stories)).to eq(Story.where(complete: false))  # opposite controller.assign
    end

    before { session[:user_id] = nil }
    it "redirects if not logged in?" do
      session[:user_id] = nil
      get :index
      expect(response).to render_template(:login)
    end

    before { session[:user_id] = user.id }
    it "renders template :index" do
      get :index
      response.should render_template(:"stories/index")
    end
  end

  describe "#create" do
    let(:story) { FactoryGirl.create(:story) }

    it "redirects if success" do
      post :create, contribution: { body: "posted contribution", user_id: user.id, story_id: story.id }
      expect(response).to be_redirect
    end

    it "creates a new contribution" do
      expect{post :create, contribution: { body: "posted contribution", user_id: user.id, story_id: story.id }}.to
      change{story.contributions.count}.by(1)
    end

    it "errors if body is not present" do
      expect{post :create, contribution: { body: "posted contribution", user_id: user.id, story_id: story.id }}.to
      change{story.contributions.count}.by(0)
    end

    it "renders template :new if error" do
      post :create, contribution: { body: "", user_id: user.id, story_id: story.id }
      response.should render_template(:new)
    end
  end

end

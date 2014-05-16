require 'spec_helper'

describe StoriesController do
  let!(:user) { FactoryGirl.create(:user) }

  describe "signed_in? helper" do
    context "with user logged in" do
      before do
        session[:user_id] = user.id
      end

      it "returns true" do
        expect(controller.send(:signed_in?)).to be_true
      end
    end
  end

  describe "#new" do
    context "with user not logged in" do
      it "redirects if user not logged in" do
        get :new
        expect(response).to be_redirect
      end
    end

    context "with user logged in" do
      before { session[:user_id] = user.id }
      it "assigns @story to Story.new" do
        get :new
        expect(assigns(:story)).to be_a_new Story
      end
    end
  end

  describe "#create" do
    it "should create new story with valid attributes" do
      expect {
        post :create, story: FactoryGirl.attributes_for(:story)
        expect(response).to be_redirect
      }.to change { Story.count }.by(1)
    end

    it "should not create a new story in the case of invalid attributes" do
      expect {
        post :create, story: { title: "", beginning: "" }
        expect(response).to_not be_redirect
      }.to_not change { Story.count }
    end
  end

  describe "#show" do
    let!(:story) { FactoryGirl.create(:story) }
    context "with user not logged in" do
      it "redirects if user not logged in" do
        get :show, id: story.id
        expect(response).to be_redirect
      end
    end

    context "with user logged in" do
      before { session[:user_id] = user.id }

      it "renders the show page" do
        get :show, id: story.id
        expect(response).to be_success
      end
    end

    context "with invalid story ID" do
      before { session[:user_id] = user.id }
      it "doesn't raise a RecordNotFound error" do
        get :show, id: 563
        expect(response).to be_redirect
      end
    end
  end
end


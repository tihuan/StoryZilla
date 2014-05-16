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



  end
end


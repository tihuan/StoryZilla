require "spec_helper"

describe UsersController do
  render_views
  describe "#new" do
    it "should render the signup template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "should assigns @user to User.new" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe "#create" do
    it "should create user valid attributes" do
      expect {
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to be_redirect
        }.to change { User.count }.by(1)
    end

    it "should not create user with invalid attributes" do
      expect {
        post :create, user: {username: "bob", email: "", password: "", password: ""}
        expect(response).to_not be_redirect
        }.to_not change { User.count }.by(1)
    end
  end
end

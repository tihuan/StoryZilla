require "spec_helper"

describe "UserController" do
  it "renders the signup template" do
    get :new
    expect(response).to render_template(:new)
  end

end

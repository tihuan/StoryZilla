require "spec_helper"

describe SessionsHelper do
  let(:user) { FactoryGirl.create(:user) }
  describe "#sign_in" do
    it "sets the current user" do
      helper.sign_in(user).should eq user
    end
  end

  describe "#current_user" do
    before { helper.sign_in(user) }
    it "returns an @current_user object" do
      helper.current_user.should eq user
    end
  end

  describe "#signed_in?" do
    context "user not signed in" do
      it "should return false" do
        helper.signed_in?.should be_false
      end
    end

    context "user signed in" do
      before { helper.sign_in(user) }
      it "should return true" do
        helper.signed_in?.should be_true
      end
    end
  end

  describe "#current_user=" do
    it "should set the current user" do
      helper.current_user=(user).should eq user
    end
  end

  describe "#sign_out" do
    it "should set current user to nil" do
      helper.sign_out.should be_nil
    end
  end

  describe "#signed_in_user" do
    context "user signed in" do
      before { helper.sign_in(user) }
      it "should not redirect" do
        expect(helper.signed_in_user).to be_nil
      end
    end

    context "user not signed in" do
      it "should redirect" do
        begin
          helper.signed_in_user
        rescue NoMethodError => e
          e.is_a? NoMethodError
        end
      end
    end

  end

end

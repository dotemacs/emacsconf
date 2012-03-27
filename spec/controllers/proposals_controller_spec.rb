require 'spec_helper'

describe ProposalsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    describe "for non-signed-in users" do
      it "should deny access" do
        get :new
        response.should redirect_to '/users/sign_in'
      end
    end

    describe "for signed-in users" do
      it "should be successful" do
        sign_in FactoryGirl.create(:user)
        get 'new'
        response.should be_success
      end
    end
  end # GET new

end

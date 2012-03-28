require 'spec_helper'

describe CommentsController do

  describe "GET 'new'" do
    context "for non-signed-in users" do

      before(:all) { User.delete_all }
      let(:proposal) { FactoryGirl.create(:proposal) }

      it "should deny access" do
        get :new, :proposal => proposal
        response.should redirect_to '/users/sign_in'
      end
    end

    context "for signed in users" do
      let(:proposal) { FactoryGirl.create(:proposal) }

      it "should be successful" do
        sign_in FactoryGirl.create(:user)
        get :new, :proposal_id => proposal.id
        response.should be_success
      end
    end
  end # GET new

  describe "POST 'create'" do
    before :each do
      User.destroy_all
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    context "for signed-in users" do
      let(:proposal) { FactoryGirl.create(:proposal) }
      let(:comment) { FactoryGirl.attributes_for(:comment) }

      it "should create a proposal" do
        post :create, :proposal_id => proposal.id, :comment => comment
        response.should redirect_to proposal_path(proposal.id)
      end
    end
  end

end

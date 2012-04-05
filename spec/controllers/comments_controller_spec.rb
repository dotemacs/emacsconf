require 'spec_helper'

describe CommentsController do

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

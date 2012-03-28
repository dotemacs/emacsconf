require 'spec_helper'

describe ProposalsController do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'new'" do
    context "for non-signed-in users" do

      before(:all) { User.delete_all }

      it "should deny access" do
        get :new
        response.should redirect_to '/users/sign_in'
      end
    end

    context "for signed-in users" do
      before(:all) do
        User.delete_all
      end

      after(:all) do
        User.delete_all
      end

      it "should be successful" do
        sign_in FactoryGirl.create(:user)
        get :new
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
      let(:attribs) { FactoryGirl.attributes_for(:proposal) }
      let(:proposal) { Proposal.where(:subject => attribs[:subject]).first }

      it "should create a proposal" do
        post :create, :proposal => attribs
        response.should redirect_to proposal_path(proposal.id)
      end

      it "should re-render the form" do
        post :create, :proposal => {}
        response.should render_template :new
      end
    end
  end # POST create

  describe "GET 'show'" do
    before do
      User.destroy_all
      Proposal.destroy_all
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    let(:proposal) { FactoryGirl.create(:proposal) }

    it "should show a proposal" do
      get :show, :id => proposal
      response.should be_success
    end
  end

  describe "GET 'vote_up'" do
    before do
      User.destroy_all
      Proposal.destroy_all
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    before :each do
      Proposal.delete_all
      @proposal = FactoryGirl.create(:proposal)
    end

    it "should up vote a proposal" do
      @proposal.votes.should == 0
      get :vote_up, :id => @proposal
      @proposal.reload
      @proposal.votes.should == 1
    end

    it "should show the proposal after up vote" do
      get :vote_up, :id => @proposal
      response.should redirect_to proposal_path(@proposal.id)
    end

  end

end

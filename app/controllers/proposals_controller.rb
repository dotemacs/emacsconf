class ProposalsController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(params[:proposal])
    if @proposal.save
      redirect_to @proposal
    else
      render :new
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def vote_up
    @proposal = Proposal.find(params[:id])
    current_user.up_vote!(@proposal)
    redirect_to @proposal
  end

  def vote_down
    @proposal = Proposal.find(params[:id])
    current_user.down_vote!(@proposal)
    redirect_to @proposal
  end

end

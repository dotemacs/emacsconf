class ProposalsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = current_user.proposals.new
  end

  def create
    @proposal = current_user.proposals.new(params[:proposal])

    if @proposal.save
      redirect_to @proposal
    else
      render :new
    end
  end

  def show
    @proposal = Proposal.includes(:comments).find(params[:id])
    @comments = @proposal.comments.includes(:user)
    @new_comment = @proposal.comments.new
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

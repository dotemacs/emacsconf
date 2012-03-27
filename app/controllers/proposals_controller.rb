class ProposalsController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
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

end

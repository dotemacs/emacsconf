class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @proposal = Proposal.find(params[:proposal_id])
    @comment = @proposal.comments.build
  end

  def create
    @proposal = Proposal.find(params[:proposal_id])
    @comment = @proposal.comments.new(params[:comment])

    if @comment.save
      flash[:success] = "Comment added, thank you for participating"
      redirect_to @proposal
    end

  end
end

class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @proposal = Proposal.find(params[:proposal_id])
    @comment = current_user.comments.new(params[:comment])
    @comment.proposal_id = @proposal.id

    if @comment.save
      flash[:success] = "Comment added, thank you for participating"
      redirect_to @proposal
    end

  end
end

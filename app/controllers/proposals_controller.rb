class ProposalsController < ApplicationController
  before_filter :authenticate_user!, :only => :new

  def index
  end

  def new
  end
end

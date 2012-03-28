class Proposal < ActiveRecord::Base
  validates_presence_of :subject, :body

  make_voteable
end

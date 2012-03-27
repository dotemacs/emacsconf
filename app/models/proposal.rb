class Proposal < ActiveRecord::Base
  validates_presence_of :subject, :body
end

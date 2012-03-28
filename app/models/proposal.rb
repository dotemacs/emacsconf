class Proposal < ActiveRecord::Base
  has_many :comments
  validates_presence_of :subject, :body


  make_voteable
end

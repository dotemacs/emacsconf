class Proposal < ActiveRecord::Base
  attr_accessible :subject, :body

  belongs_to :user
  has_many :comments
  validates_presence_of :subject, :body


  make_voteable
end

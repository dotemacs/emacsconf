class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal
  validates_presence_of :content
end

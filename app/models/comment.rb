class Comment < ApplicationRecord
  
  #soft delete
  acts_as_paranoid
  
  #relation
  belongs_to :user
  belongs_to :story

  validates :content, presence: true
  
end
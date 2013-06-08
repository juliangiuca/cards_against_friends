class Hand < ActiveRecord::Base
   attr_accessible :user
  belongs_to :game
  belongs_to :user
  has_many :answers
end

class Hand < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :game
  belongs_to :user
  has_many :answers
end

class Round < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :answers
  has_one :question
  belongs_to :game
end

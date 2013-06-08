class Round < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :answers
  belongs_to :question
  belongs_to :game
end

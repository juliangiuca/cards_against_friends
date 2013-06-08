class Game < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :rounds
  has_many :hands
  has_many :users, :through => :hands
end

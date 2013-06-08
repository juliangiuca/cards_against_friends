class Game < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :rounds
  has_many :hands
  has_many :players, :source => :user, :through => :hands

  def start!
    false
  end

  def add_player(player)
    generate_hand(player)
  end

  private
  def generate_hand(player)
    hands.create(user: player) unless hands.where(user_id: player.id).present?
  end
end

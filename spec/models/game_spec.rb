require 'spec_helper'

describe Game do
  pending "add some examples to (or delete) #{__FILE__}"

  it "should know who's in a game"

  describe "starting a game" do
    before do
    end

    it "should not start with less than three players" do
      player1 = create(:user)
      player2 = create(:user)
      game = Game.create
      game.add_player(player1)
      game.add_player(player2)
      game.start!.should be_false
    end
  end

end

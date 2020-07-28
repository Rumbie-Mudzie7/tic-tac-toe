require './lib/game.rb'
require './lib/player.rb'

describe GameLogic do
    let (:game) {GameLogic.new} 
    let (:player_1) {Player.new("Rumbie", "X")}
    let (:player_2) {Player.new("Talha", "O")}
  
    describe "#board" do
        it "returns the drawn board in string" do
            expect(game.board).to eql("\n    |  7  |  8  |  9 |\n    ------------------\n    |  4  |  5  |  6 |\n    ------------------\n    |  1  |  2  |  3 |\n    ------------------")
        end
    end

    describe "#switch_player" do
        it "returns the player after switching" do
            game.player1 = player_1
            game.player2 = player_2
            game.switch_player
            expect(game.player).to eql(player_1)
            game.switch_player
            expect(game.player).to eql(player_2)
        end
    end
end


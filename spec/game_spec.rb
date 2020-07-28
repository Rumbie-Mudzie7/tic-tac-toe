
require './lib/game.rb'
require './lib/player.rb'

describe GameLogic do
  let(:game) { GameLogic.new }
  let(:player_1) { Player.new('Rumbie', 'X') }
  let(:player_2) { Player.new('Talha', 'O') }

  # rubocop:disable Layout/LineLength
  describe '#board' do
    it 'returns the drawn board in string' do
      expect(game.board).to eql("\n    |  7  |  8  |  9 |\n    ------------------\n    |  4  |  5  |  6 |\n    ------------------\n    |  1  |  2  |  3 |\n    ------------------")
    end
  end
  # rubocop:enable Layout/LineLength

  describe '#switch_player' do
    it 'returns the player after switching' do
      game.player1 = player_1
      game.player2 = player_2
      game.switch_player
      expect(game.player).to eql(player_1)
      game.switch_player
      expect(game.player).to eql(player_2)
    end
  end

  # rubocop:disable Layout/LineLength
  describe '#update_board' do
    it 'updates board with marked move' do
      game.player1 = player_1
      game.switch_player
      game.update_board(3)
      expect(game.board).to eql("\n    |  7  |  8  |  9 |\n    ------------------\n    |  4  |  5  |  6 |\n    ------------------\n    |  1  |  2  |  X |\n    ------------------")
    end
  end
  # rubocop:enable Layout/LineLength

  describe '#win?' do
    it 'checks win condition on row and return true' do
      game.player1 = player_1
      game.switch_player
      game.update_board(1)
      game.update_board(2)
      game.update_board(3)
      expect(game.win?).to eql(true)
    end

    it 'checks win condition on column and return true' do
      game.player1 = player_1
      game.switch_player
      game.update_board(1)
      game.update_board(4)
      game.update_board(7)
      expect(game.win?).to eql(true)
    end

    it 'checks win condition on digonal and return true' do
      game.player1 = player_1
      game.switch_player
      game.update_board(1)
      game.update_board(5)
      game.update_board(9)
      expect(game.win?).to eql(true)
    end

    it 'checks win condition on cross digonal and return true' do
      game.player1 = player_1
      game.switch_player
      game.update_board(3)
      game.update_board(5)
      game.update_board(7)
      expect(game.win?).to eql(true)
    end
  end
end

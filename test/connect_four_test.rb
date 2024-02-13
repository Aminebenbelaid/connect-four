require 'test_helper'

describe GameLogic do
  before do
    @game = GameLogic.new
  end

  it 'initializes the board correctly' do
    assert_equal 8, @game.board.size
    assert_equal 8, @game.board.first.size
  end

  it 'initializes the current player correctly' do
    assert_includes GameLogic::PLAYERS, @game.current_player
  end

  it 'drops a piece correctly' do
    column = 3
    row = @game.drop_piece(column)
    assert_equal @game.current_player, @game.board[row][column]
  end

  it 'checks if a column is full correctly' do
    column = 3
    8.times { @game.drop_piece(column) }
    assert @game.column_full?(column)
  end

  it 'switches the current player correctly' do
    @game.switch_player # switch to the second player from x to o
    assert_equal 'O', @game.current_player
  end
  it 'detects when the game is over vertically' do
    4.times { @game.drop_piece(0) } # drop four pieces in the first column
    assert @game.game_over?(3, 0) # check the last piece dropped
  end

  it 'detects when the game is over horizontally' do
    4.times { |i| @game.drop_piece(i) } # drop four pieces in the first row
    assert @game.game_over?(0, 3) # check the last piece dropped
  end

  describe 'draw?' do
    it 'returns true when the board is full' do
      @game.instance_variable_set(:@board, Array.new(8) { Array.new(8, 'x') })
      _(@game.draw?).must_equal true
    end

    it 'returns false when the board is not full' do
      @game.instance_variable_set(:@board, Array.new(8) { Array.new(8, GameLogic::EMPTY_CELL) })
      _(@game.draw?).must_equal false
    end
  end
end

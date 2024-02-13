class GameLogic
  attr_reader :board, :current_player

  EMPTY_CELL = '.'
  PLAYERS = %w[X O]
  DIRECTIONS = [[-1, 0], [1, 0], [0, 1], [0, -1], [-1, 1], [1, -1], [-1, -1], [1, 1]]
  CONNECTIONS = 4
  BOARD_SIZE = 8

  def initialize
    @board = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE, EMPTY_CELL) }
    @players = PLAYERS.cycle
    @current_player = @players.next
  end

  def drop_piece(column)
    row = board.index { |r| r[column] == EMPTY_CELL }
    @board[row][column] = current_player
    row
  end

  def column_full?(column)
    board.all? { |row| row[column] != EMPTY_CELL }
  end

  def game_over?(row, column)
    DIRECTIONS.any? do |dx, dy|
      CONNECTIONS.times.all? do |i|
        r = row + i * dx
        c = column + i * dy
        r.between?(0, BOARD_SIZE - 1) && c.between?(0, BOARD_SIZE - 1) && board.dig(r, c) == current_player
      end
    end
  end

  def switch_player
    @current_player = @players.next
  end

  def draw?
    @board.all? do |row|
      row.none? { |cell| cell == EMPTY_CELL }
    end
  end
end

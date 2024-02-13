require_relative 'game_logic'

class GameDisplay
  def initialize(game)
    @game = game
  end

  def play
    loop do
      display_board
      column = move
      row = @game.drop_piece(column)

      if @game.game_over?(row, column)
        display_board
        return "#{@game.current_player} wins!"
      elsif @game.draw?
        display_board
        return "It's a draw!"
      end

      @game.switch_player
    end
  end

  private

  def display_board
    puts "1 2 3 4 5 6 7 8"
    @game.board.reverse.each { |row| puts row.join(" ") }
  end

  def move
    loop do
      print "Player #{@game.current_player}, enter your move (1-8): "
      move = gets.to_i - 1
      return move if move.between?(0, 7) && !@game.column_full?(move)
      puts "Invalid move. Try again."
    end
  end
end

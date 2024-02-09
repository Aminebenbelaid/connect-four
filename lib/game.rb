class Game

# I didn't use attr_accessor because I don't want to allow the user to change the value of the variables.
# at the end it is a game and the user should not be able to change the rules of the game.

  def initialize
        @screen = Array.new(8) {Array.new(8, ".")}
        @players = ["x", "o"]
        @current_player = @players[0]
  end
def self.run #This method is used to start the game from connect_four.rb
    new.play
end

def play
    while true
            display
            column = valid_column
            row = valid_row(column)
            @screen[row][column] = @current_player
            if won
                display
                puts "Player "+ @current_player +" wins!"
                break
            elsif draw
                display
                puts "It's a draw!"
                break
            end
            switch_player
    end
end

private #all methods below are private , because they are not meant to be called from outside the class (encapsulation)


  def switch_player
    if(@current_player == @players[0])
       @current_player = @players[1]
    else
      @current_player = @players[0]
    end
  end

  def display
        puts "12345678"
        @screen.each do |row|
          puts "" + row.join
        end
  end

  def valid_column
    move = nil
    until move && move.between?(0, 7) && @screen[0][move] == "." #checking if column is full. The 0 represents the top row of the column
    puts "Player #{@current_player}, enter your move (1-8):"
    move = gets.chomp.to_i - 1
    end
    move
  end

  def valid_row(column)
    @screen.rindex { |row| row[column] == '.' }    #find the next empty row in the same column (Backwards)
  end

  def won
    directions = [[-1,-1], [-1, 0], [-1, 1], [0, 1]] #all possible directions to win (diagonal (both ways), vertical (right), horizontal (up))
    @screen.each_with_index do |row, row_index|
      row.each_index do |column_index|
          next if @screen[row_index][column_index] == '.' #skip empty cells
            return true if directions.any?{ |direction| check_win(row_index, column_index, direction) }
         end
    end
    false
     end


  def check_win(row, column, direction)
    4.times do #check 4 cells in a row in order to win the game
      return false unless row.between?(0, 7) && column.between?(0, 7) && @screen[row][column] == @current_player
      row += direction[0]
      column += direction[1]
    end
    true
  end


  def draw #Checking all the cells in the screen

      @screen.all? do |row|
        row.all? do |cell|
          cell != '.'
        end
      end
  end

end

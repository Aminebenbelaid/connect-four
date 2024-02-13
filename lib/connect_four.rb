require_relative "game_logic"
require_relative "game_display"

module ConnectFour
  def self.run
    game = GameLogic.new
    show = GameDisplay.new(game)
    puts show.play, 'Game over!'
    true
  end
end

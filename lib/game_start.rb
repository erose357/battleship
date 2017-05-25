require './lib/data_structure'
require './lib/game_board'
require './lib/game_messages'
require 'pry'
include GameMessages

player = GameBoard.new
computer = GameBoard.new

class GameStart

  def ship_placement

    GameMessages.start_game

    end_loop = false

    until  end_loop == true
      user_input = gets.chomp
      game = DataStructure.new
      game.small_ship_random_placement
      game.large_ship_random_placement
      if user_input == "q" || user_input == "quit"
        GameMessages.quit_message
        break
      end
binding.pry
    end
  end

end

require './lib/game_messages'
require './lib/game_start'
include GameMessages

end_loop = false


GameMessages.welcome_message

until end_loop == true
  user_input = gets.chomp
  if user_input == "q" || user_input == "quit"
    GameMessages.quit_message
    break
  elsif user_input == "i" || user_input == "instructions"
    GameMessages.instructions
  elsif user_input == "p" || user_input == "play"
    game_start = GameStart.new
    game_start.ship_placement
    end_loop = true
  end
end

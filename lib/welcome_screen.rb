require './lib/game_setup'

class WelcomeScreen

  def welcome_message
    "Welcome to BATTLESHIP"
  end

  def options
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
  end

  def play
    GameSetup.new
  end

  def instructions
    "need to write instructions message"
  end

  def exit
    "exits to terminal"
  end



end

# screen = WelcomeScreen.new
# puts screen.welcome_message
# print screen.options

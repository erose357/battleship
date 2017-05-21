require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/welcome_screen'

class WelcomeScreenTest < Minitest::Test

  def test_user_welcome_screen_message
    screen = WelcomeScreen.new
    expected = "Welcome to BATTLESHIP"

    assert_equal expected, screen.welcome_message
  end

  def test_user_options_message
    screen = WelcomeScreen.new
    expected = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"

    assert_equal expected, screen.options
  end

  def test_play_button
    screen = WelcomeScreen.new

    assert_instance_of GameSetup, GameSetup.new
  end

  def test_instruction_button
    screen = WelcomeScreen.new
    expected = "need to write instructions message"
    #this message will print to the screen
    #and then will have a prompt below
    #repeat options on message screen?
    assert_equal expected, screen.instructions
  end

  def test_exit_button
    screen = WelcomeScreen.new
    expected = "exits to terminal"
    #need to figure out how to accomplish this, will need to tie into REPL
    assert_equal expected, screen.exit
  end

end

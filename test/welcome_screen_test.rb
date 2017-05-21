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

end

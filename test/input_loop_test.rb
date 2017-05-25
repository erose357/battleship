require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/input_loop'

class InputLoopTest < Minitest::Test

  def test_input_loop_prompt
    loop = InputLoop.new
    expected = ">"

    assert_equal expected, loop.prompt
  end

  def test_loop_creates_new_instance_of_welcome_screen
    loop = InputLoop.new

    assert_instance_of WelcomeScreen, loop.welcome
  end

  def test_welcome_message_at_game_start
    loop = InputLoop.new
    expected = "Welcome to BATTLESHIP"

    assert_equal expected, loop.welcome.welcome_message
  end

end

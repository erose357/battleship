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

  def test_loop_until_break
  skip
  end

end

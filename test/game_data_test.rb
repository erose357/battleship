require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './game_board_data_expl'

class GameDataTest < Minitest::Test

  def test_print_one_row
    game_data = GameData.new
    expected = ".\s"".\s"".\s"".\s"
    actual = game_data.print_one_row

    assert_equal expected, actual
  end

  def test_print_two_rows
    skip
    game_data = GameData.new
    expected = ".\s"".\s"".\s"".\s\n\s"".\s"".\s"".\s"".\s\n"
    actual = game_data.print_one_row

    assert_equal expected, actual
  end
end

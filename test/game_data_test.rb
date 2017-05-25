require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_data'
# require 'pry'
class GameDataTest < Minitest::Test

  def test_print_border
    game_data = GameData.new
    expected = "==========="

    assert_equal expected, game_data.border
  end

  def test_print_row_labels
    game_data = GameData.new
    expected = ["A", "B", "C", "D"]

    assert_equal expected, game_data.row_labels
  end

  def test_print_column_labels
    game_data = GameData.new
    expected = [ "1", "2", "3", "4" ]

    assert_equal expected, game_data.column_labels
  end

  def test_print_border_and_column_labels
    #need to figure out return value -  display correct, returns nil
    game_data = GameData.new
    expected = "===========\n""A\s""B\s""C\s""D"

    assert_equal expected, game_data.print_board
  end

  def test_print_data_area_of_game_board
    skip
    #need to figure out return value display correct, returns nil
    game_data = GameData.new
    expected = ".\s.\s.\s.\s\n.\s.\s.\s.\s\n.\s.\s.\s.\s\n.\s.\s.\s."

    assert_equal expected, game_data.print_data_area
  end
end

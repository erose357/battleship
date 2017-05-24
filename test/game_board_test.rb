require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board.rb'
require 'pry'
class GameBoardTest < Minitest::Test

  def test_instance_of

    assert_instance_of GameBoard, GameBoard.new
  end

  def test_board_top_border
    game_board = GameBoard.new
    expected = "==========="
    actual = game_board.top_border

    assert_equal expected, actual
  end

  def test_print_line_one
    game_board = GameBoard.new
    expected = ".\s" "1\s" "2\s" "3\s" "4"

    assert_equal expected, game_board.line_one
  end

  def test_print_line_two
    game_board = GameBoard.new
    expected = "A\s" ".\s" ".\s" ".\s" "."

    assert_equal expected, game_board.line_two
  end

  def test_print_line_three
    game_board = GameBoard.new
    expected = "B\s" ".\s" ".\s" ".\s" "."

    assert_equal expected, game_board.line_three
  end

  def test_print_line_four
    game_board = GameBoard.new
    expected = "C\s" ".\s" ".\s" ".\s" "."

    assert_equal expected, game_board.line_four
  end

  def test_print_line_five
    game_board = GameBoard.new
    expected = "D\s" ".\s" ".\s" ".\s" "."

    assert_equal expected, game_board.line_five
  end

  def test_print_bottom_border
    game_board = GameBoard.new
    expected = "==========="

    assert_equal expected, game_board.bottom_border
  end

  def test_print_lines_one_and_two
    game_board = GameBoard.new
    expected = "===========\n"".\s" "1\s" "2\s" "3\s" "4\n""A\s" ".\s" ".\s" ".\s" ".\n""B" "." "." "." ".\n""C" "." "." "." ".\n""D" "." "." "." ".\n""===========\n"
    actual = game_board.print_board

    assert_equal expected, actual
  end

  # def test_update_game_board_with_shot
  #   player = GameBoard.new

end

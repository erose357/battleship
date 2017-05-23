require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/data_structure'
require 'pry'
class DataStructureTest < Minitest::Test

  def test_keys_in_coordinates
    data = DataStructure.new
    expected = [ "A1", "A2", "A3", "A4", "B1", "B2", "B3",
                 "B4", "C1", "C2", "C3", "C4", "D1", "D2",
                 "D3", "D4" ]

    assert_equal expected, data.grid_coordinates.keys
  end

  def test_one_change_one_key_value
    data = DataStructure.new
    expected = "M"
    actual = data.grid_coordinates["A1"] = "M"

    assert_equal expected, actual
  end

  def test_value_change_by_method
    data = DataStructure.new

    assert_equal "H", data.hit("C3")
  end

  def test_value_change_for_miss
    data = DataStructure.new

    assert_equal "M", data.miss("D4")
  end

  def test_small_ship_input_equals_output
    data = DataStructure.new

    assert_equal ["D4", "D3"], data.small_ship_placement[["D4", "D3"]]
  end

  def test_user_input_to_get_small_ship_placement
    skip
    #may need to rewrite this, since I've added functionality
    #in the small_ship_input method
    data = DataStructure.new
    input = "D2 D1"

    assert_equal ["D2", "D1"], data.small_ship_input(input)
  end

  def test_another_input_to_get_small_ship_placement
    skip
    #may need to rewrite this, since I've added functionality
    #in the small_ship_input method
    data = DataStructure.new
    input = "A2 B2"

    assert_equal ["A2", "B2"], data.small_ship_input(input)
  end

  def test_add_small_ship_to_grid_coordinates
    data = DataStructure.new
    input = "A2 A1"
    coordinates = data.small_ship_input(input)
    expected = ["S", "S"]
    actual = data.player_board.values_at("A2", "A1")

    assert_equal expected, actual
  end

  def test_small_ship_random_placement
    data = DataStructure.new
    verify = data.small_ship_random_placement

    assert_equal ["S","S"], data.computer_board.values_at(verify[0], verify[1])
  end

  def test_large_ship_placement_hash
    data = DataStructure.new
    input = "B2 B3 B4"
    input = input.split

    assert_equal ["B2", "B3", "B4"], data.large_ship_placement[input]
  end

  def test_large_ship_random_placement
    data = DataStructure.new
    verify = data.large_ship_random_placement

    assert_equal ["S", "S", "S"], data.computer_board.values_at(verify[0], verify[1], verify[2])
  end

  def test_recognize_ship_overlap
    data = DataStructure.new
    data.small_ship_input("B1 A1")
    data.large_ship_input("B1 C1 D1")

    assert data.ship_overlap?
  end

  def test_recognize_no_overlap
    data = DataStructure.new
    data.small_ship_input("A1 A2")
    data.large_ship_input("B1 C1 D1")

    refute data.ship_overlap?
  end

  def test_rerun_random_placement_if_overlap
    data = DataStructure.new
    data.small_ship_input("B1 A1")
    data.large_ship_random_placement

    refute data.ship_overlap?
  end

  def test_random_computer_shot_selection
    data = DataStructure.new
    shot = data.computer_shot

    assert data.player_board.include?(shot)
  end

  def test_different_random_computer_shot
    data = DataStructure.new
    shot = data.computer_shot

    assert data.player_board.include?(shot)
  end

  def test_computer_shot_taken_M
    data = DataStructure.new
    data.player_board.update({"A3" => "M"})


    assert data.computer_shot_taken?("A3")
  end

  def test_computer_shot_taken_H
    data = DataStructure.new
    data.player_board.update({"D1" => "H"})

    assert data.computer_shot_taken?("D1")
  end

  def test_computer_shot_taken_S
    data = DataStructure.new
    data.player_board.update({"C3" => "S"})

    refute data.computer_shot_taken?("C3")
  end

  def test_computer_shot_not_taken
    data = DataStructure.new

    refute data.computer_shot_taken?("C3")
  end

  def test_if_computer_shot_is_a_hit
    data = DataStructure.new
    data.player_board.update({"D2" => "S"})

    assert data.computer_shot_hit?("D2")
  end

  def test_if_computer_shot_is_not_a_hit
    data = DataStructure.new

    refute data.computer_shot_hit?("C1")
  end

  def test_new_computer_shot_if_shot_already_taken_M
    data = DataStructure.new
    data.player_board.update({"A4" => "M"})
    shot_one = data.computer_shot_cycle
    expected = data.player_board.values
    shot_two = data.computer_shot_cycle
    actual = data.player_board.values

    refute_equal expected, actual
  end
end

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
# binding.pry
    assert_equal expected, actual
  end




  def test_random_ship_placement
    skip
    data = DataStructure.new

    assert_equal expected, actual
  end

end

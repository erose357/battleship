require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/data_structure'

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

  def test_random_ship_placement
    data = DataStructure.new

    assert_equal expected, actual
  end

end

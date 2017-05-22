
class DataStructure

  attr_reader :player_board,
              :computer_board

  def initialize
    @player_board   = grid_coordinates
    @computer_board = {}
  end

  def grid_coordinates
    { "A1" => "", "A2" => "", "A3" => "", "A4" => "",
      "B1" => "", "B2" => "", "B3" => "", "B4" => "",
      "C1" => "", "C2" => "", "C3" => "", "C4" => "",
      "D1" => "", "D2" => "", "D3" => "", "D4" => "" }
  end

  def small_ship_placement
    { ["A1", "A2"] => ["A1", "A2"], ["A1", "B1"] => ["A1", "B1"],
      ["A2", "A1"] => ["A2", "A1"], ["A2", "B2"] => ["A2", "B2"],
      ["A2", "A3"] => ["A2", "A3"], ["A3", "A2"] => ["A3", "A2"],
      ["A3", "B3"] => ["A3", "B3"], ["A3", "A4"] => ["A3", "A4"],
      ["A4", "A3"] => ["A4", "A3"], ["A4", "B4"] => ["A4", "B4"],
      ["B1", "A1"] => ["B1", "A1"], ["B1", "B2"] => ["B1", "B2"],
      ["B1", "C1"] => ["B1", "C1"], ["B2", "B1"] => ["B2", "B1"],
      ["B2", "C2"] => ["B2", "C2"], ["B2", "A2"] => ["B2", "A2"],
      ["B2", "B3"] => ["B2", "B3"], ["B3", "B2"] => ["B3", "B2"],
      ["B3", "A3"] => ["B3", "A3"], ["B3", "B4"] => ["B3", "B4"],
      ["B3", "C3"] => ["B3", "C3"], ["B4", "B3"] => ["B4", "B3"],
      ["B4", "A4"] => ["B4", "A4"], ["B4", "C4"] => ["B4", "C4"],
      ["C1", "B1"] => ["C1", "B1"], ["C1", "C2"] => ["C1", "C2"],
      ["C1", "D1"] => ["C1", "D1"], ["C2", "C1"] => ["C2", "C1"],
      ["C2", "B2"] => ["C2", "B2"], ["C2", "C3"] => ["C2", "C3"],
      ["C2", "D2"] => ["C2", "D2"], ["C3", "C2"] => ["C3", "C2"],
      ["C3", "B3"] => ["C3", "B3"], ["C3", "C4"] => ["C3", "C4"],
      ["C3", "D3"] => ["C3", "D3"], ["C4", "C3"] => ["C4", "C3"],
      ["C4", "B4"] => ["C4", "B4"], ["C4", "D4"] => ["C4", "D4"],
      ["D1", "C1"] => ["D1", "C1"], ["D1", "D2"] => ["D1", "D2"],
      ["D2", "D1"] => ["D2", "D1"], ["D2", "C2"] => ["D2", "C2"],
      ["D2", "D3"] => ["D2", "D3"], ["D3", "D2"] => ["D3", "D2"],
      ["D3", "C3"] => ["D3", "C3"], ["D3", "D4"] => ["D3", "D4"],
      ["D4", "D3"] => ["D4", "D3"], ["D4", "C4"] => ["D4", "C4"] }
    end

  def small_ship_input(input)
    placement = input.split(" ")
    placement.each do |key|
      @player_board = @player_board.update({key => "S"})
    end
  end

  def small_ship_random_placement
    spot = small_ship_placement.keys.sample.join(" ")
    small_ship_input(spot)
  end

  def hit(spot)
    grid_coordinates[spot] = "H"
  end

  def miss(spot)
    grid_coordinates[spot] = "M"
  end

end

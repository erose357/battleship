require 'pry'
class DataStructure

  attr_reader :player_board,
              :computer_board,
              :small_ship,
              :large_ship

  def initialize
    @player_board   = grid_coordinates
    @computer_board = grid_coordinates
    @small_ship     = []
    @large_ship     = []
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

    def large_ship_placement
      { ["A1", "A2", "A3"] => ["A1", "A2", "A3"], ["A1", "B1", "C1"] => ["A1", "B1", "C1"],
        ["A2", "A3", "A4"] => ["A2", "A3", "A4"], ["A2", "B2", "C2"] => ["A2", "B2", "C2"],
        ["A3", "A2", "A1"] => ["A3", "A2", "A1"], ["A3", "B3", "C3"] => ["A3", "B3", "C3"],
        ["A4", "A3", "A2"] => ["A4", "A3", "A2"], ["A4", "B4", "C4"] => ["A4", "B4", "C4"],
        ["B1", "C1", "D1"] => ["B1", "C1", "D1"], ["B1", "B2", "B3"] => ["B1", "B2", "B3"],
        ["B2", "B3", "B4"] => ["B2", "B3", "B4"], ["B2", "C2", "D2"] => ["B2", "C2", "D2"],
        ["B3", "B2", "B1"] => ["B3", "B2", "B1"], ["B3", "C3", "D3"] => ["B3", "C3", "D3"],
        ["B4", "B3", "B2"] => ["B4", "B3", "B2"], ["B4", "C4", "D4"] => ["B4", "C4", "D4"],
        ["C1", "C2", "C3"] => ["C1", "C2", "C3"], ["C1", "B1", "A1"] => ["C1", "B1", "A1"],
        ["C2", "C3", "C4"] => ["C2", "C3", "C4"], ["C2", "B2", "A2"] => ["C2", "B2", "A2"],
        ["C3", "C2", "C1"] => ["C3", "C2", "C1"], ["C3", "B3", "A3"] => ["C3", "B3", "A3"],
        ["C4", "C3", "C2"] => ["C4", "C3", "C2"], ["C4", "B4", "A4"] => ["C4", "B4", "A4"],
        ["D1", "C1", "B1"] => ["D1", "C1", "B1"], ["D1", "D2", "D3"] => ["D1", "D2", "D3"],
        ["D2", "D3", "D4"] => ["D2", "D3", "D4"], ["D2", "C2", "B2"] => ["D2", "C2", "B2"],
        ["D3", "D2", "D1"] => ["D3", "D2", "D1"], ["D3", "C3", "B3"] => ["D3", "C3", "B3"],
        ["D4", "D3", "D2"] => ["D4", "D3", "D2"], ["D4", "C4", "B4"] => ["D4", "C4", "B4"] }
      end

  def small_ship_input(input)
    placement = input.split(" ")
    @small_ship = placement
    placement.each do |key|
      @player_board = @player_board.update({key => "S"})
    end
  end

  def small_ship_random_placement
    spot = small_ship_placement.keys.sample.join(" ")
    small_ship_input_computer(spot)
  end

  def small_ship_input_computer(input)
    placement = input.split(" ")
    @small_ship = placement
    placement.each do |key|
      @computer_board = @computer_board.update({key => "S"})
    end
  end

  def large_ship_input(input)
    placement = input.split(" ")
    @large_ship = placement
    placement.each do |key|
      @player_board = @player_board.update({key => "S"})
    end
  end

  def large_ship_random_placement
    @large_ship = large_ship_placement.keys.sample
    until ship_overlap? == false
      @large_ship = large_ship_placement.keys.sample
    end
    spot = @large_ship.join(" ")
    large_ship_input_computer(spot)
  end

  def large_ship_input_computer(input)
    placement = input.split(" ")
    @large_ship = placement
    placement.each do |key|
      @computer_board = @computer_board.update({key => "S"})
    end
  end

  def ship_overlap?
    index = 0
    overlap = false
    until overlap == true || index > 2
      @large_ship.each do |coordinate|
        if coordinate == small_ship[index]
          overlap = true
        else
        end
      end
      index +=1
    end
    overlap
  end

  def computer_shot
    @player_board.keys.sample
  end

  def computer_shot_taken?(shot)
    shot = @player_board[shot]
      if shot == ""
        false
      elsif shot == "S" || shot == "H" || shot == "M"
        true
      end
  end

#save this for assignment step
  #   if spot == ""
  #     @player_board.update({shot => "M"})
  #   elsif spot == "S"
  #     @player_board.update({shot => "H"})
  #   else
  #     puts "error"
  #   end
  # end




  def hit(spot)
    grid_coordinates[spot] = "H"
  end

  def miss(spot)
    grid_coordinates[spot] = "M"
  end

end


require './lib/game_board'


class DataStructure

  attr_accessor :computer_game_board,
                :player_game_board

  attr_reader :player_board,
              :computer_board,
              :small_ship,
              :large_ship


  def initialize
    @player_board   = grid_coordinates
    @computer_board = grid_coordinates
    @computer_game_board = GameBoard.new
    @player_game_board = GameBoard.new
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

  def small_ship_valid?(input)
   small_ship_placement.include?(input)
 end

 # def small_ship_position(input)
 #   convert = input.split(" ")
 #   verify = small_ship_valid?(convert)
 #   if verify == true
 #     small_ship_input(convert)
 #   else
 #
 #
 # end


  def large_ship_input(input)
    placement = input.split(" ")
    @large_ship = placement
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
    shot = @player_board.keys.sample
  end

  def computer_shot_taken?(shot)
    shot = @player_board[shot]
      if shot == "" || shot == "S"
        false
      elsif shot == "H" || shot == "M"
        true
      end
  end

  def computer_shot_hit?(shot)
    shot = @player_board[shot]
    if shot == "S"
      true
    else
      false
    end
  end

  def computer_shot_cycle
    shot = computer_shot
    if computer_shot_taken?(shot) == false
      if computer_shot_hit?(shot) == true
        @player_board.update({shot => "H"})
        #need to create an update for visual board too
      else
        @player_board.update({shot => "M"})
        #need to create an update for visual board too
      end
    elsif computer_shot_taken?(shot) == true
      computer_shot_cycle
    end
  end

  def player_shot(input)
    input
  end

  def player_shot_taken?(shot)
    shot = @computer_board[shot]
      if shot == "" || shot == "S"
        false
      elsif shot == "H" || shot == "M"
        true
      end
  end

  def prompt_for_new_shot
    # if player_shot_taken? == true
      #prompt for new shot
      # GameMessage.new_shot_prompt
  end

  def player_shot_cycle(input)
    player_shot(input)
    if player_shot_taken?(input) == true
      prompt_for_new_shot
    elsif player_shot_take?(input) == false
      #need a way to deal with hits
      update_computer_board(input)
    end
  end

  # def update_computer_board(input)
  #   shot = input.chars
  #   case
  #   when shot[0] == "A"
  #     @computer_game_board.line_two[shot[1]] = "M"
  #   when shot[0] == "B"
  #     @computer_game_board.line_three[shot[1]] = "M"
  #   when shot[0] == "C"
  #     @computer_game_board.line_four[shot[1]] = "M"
  #   when shot[0] == "D"
  #     @computer_game_board.line_five[shot[1]] = "M"
  #   end
  # end

end

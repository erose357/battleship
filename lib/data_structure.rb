class DataStructure

  def grid_coordinates
    { "A1" => "", "A2" => "", "A3" => "", "A4" => "",
      "B1" => "", "B2" => "", "B3" => "", "B4" => "",
      "C1" => "", "C2" => "", "C3" => "", "C4" => "",
      "D1" => "", "D2" => "", "D3" => "", "D4" => "" }
  end


  def hit(spot)
    grid_coordinates[spot] = "H"
  end

  def miss(spot)
    grid_coordinates[spot] = "M"
  end

end
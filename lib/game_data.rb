require 'pry'
class GameData

  def board_data
    { 2 => { "A1" => ".", "A2" => ".", "A3" => ".", "A4" => "." },
      3 => { "B1" => ".", "B2" => ".", "B3" => ".", "B4" => "." },
      4 => { "C1" => ".", "C2" => ".", "C3" => ".", "C4" => "." },
      5 => { "D1" => ".", "D2" => ".", "D3" => ".", "D4" => "." } }
  end

  def border
    "==========="
  end

  def row_labels
    [ "A", "B", "C", "D" ]
  end

  def column_labels
    [ "1", "2", "3", "4" ]
  end


  def print_data_area
    # string = []
    final = ""
    index = 2
    until index == 6
      string = []
      board_data[index].each do |k, v|
        string << "#{v}\s"
      end
       final += string.join+"\n"
      index += 1
      # binding.pry
    end
    # binding.pry
    return print final
  end

  def print_board
    print "#{border}\n"
    print column_labels
  end

end

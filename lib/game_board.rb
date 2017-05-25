class GameBoard

  attr_accessor :line_two,
                :line_three,
                :line_four,
                :line_five

  def initialize
    @line_two   = [ "A", ".", ".", ".", "." ]#.join("\s")
    @line_three = [ "B", ".", ".", ".", "." ]
    @line_four  = [ "C", ".", ".", ".", "." ]
    @line_five  = [ "D", ".", ".", ".", "." ]
  end

  def print_board
    p "#{top_border}"
    p "#{line_one}"
    p @line_two.join("\s")
    p @line_three.join("\s")
    p @line_four.join("\s")
    p @line_five.join("\s")
    p "#{bottom_border}"
  end

  def top_border
    "=========="
  end

  def line_one
    [ ".", "1", "2", "3", "4" ].join("\s")
  end

  # def line_two
  #   [ "A", ".", ".", ".", "." ].join("\s")
  # end

  # def line_three
  #   [ "B", ".", ".", ".", "." ].join("\s")
  # end

  # def line_four
  #   [ "C", ".", ".", ".", "." ].join("\s")
  # end
  #
  # def line_five
  #   [ "D", ".", ".", ".", "." ].join("\s")
  # end

  def bottom_border
    "=========="
  end

  def update_computer_board(input)
    shot = input.chars
    case
    when shot[0] == "A"
      @line_two[shot[1].to_i] = "M"
    when shot[0] == "B"
      line_three[shot[1].to_i] = "M"
    when shot[0] == "C"
      line_four[shot[1].to_i] = "M"
    when shot[0] == "D"
      line_five[shot[1].to_i] = "M"
    end
  end

end

# board = GameBoard.new
# board.print_board

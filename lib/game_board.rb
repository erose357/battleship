class GameBoard

  def print_board
    print "#{top_border}\n"
    print "#{line_one}\n"
    print "#{line_two}\n"
    print "#{line_three}\n"
    print "#{line_four}\n"
    print "#{line_five}\n"
    print "#{bottom_border}\n"
  end

  def top_border
    "==========="
  end

  def line_one
    [ ".", "1", "2", "3", "4" ].join("\s")
  end

  def line_two
    [ "A", ".", ".", ".", "." ].join("\s")
  end

  def line_three
    [ "B", ".", ".", ".", "." ].join("\s")
  end

  def line_four
    [ "C", ".", ".", ".", "." ].join("\s")
  end

  def line_five
    [ "D", ".", ".", ".", "." ].join("\s")
  end

  def bottom_border
    "==========="
  end

end

board = GameBoard.new
board.print_board

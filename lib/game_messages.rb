module GameMessages

  def welcome_message
    puts "Welcome to BATTLESHIP"
    puts
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print ">"
  end

  def instructions
    puts "need to write the instructions"
    print ">"
  end

  def quit_message
    puts "Exiting game"
  end

  def large_ship_prompt
    puts "Enter position for Large Ship"
    print ">"
  end

  def invalid_ship_coordinate
    puts "Invalid ship position, re-enter"
    print ">"
  end

  def invalid_shot
    puts "Invalid shot, enter new coordinate"
    print ">"
  end

  def start_game
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
    puts " "
    puts "Enter the squares for the two-unit ship:"
    print ">"
  end
end

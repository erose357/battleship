class InputLoop

  attr_reader :prompt

  def initialize
    @prompt = ">"
  end

  def loop
    @prompt
    while(input = gets.chomp)
      break if input == "exit"
    end
  end

end

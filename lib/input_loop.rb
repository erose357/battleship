require './lib/welcome_screen'

class InputLoop

  attr_reader :prompt,
              :welcome

  def initialize
    @prompt = ">"
    @welcome = WelcomeScreen.new
  end

  def loop
    print @prompt
    while(input = gets.chomp)
      break if input == "exit"
      case
      when input == "i"
        puts @welcome.instructions
        print prompt
      when input == "q"
        break
      end
    end
  end

end

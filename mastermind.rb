class Mastermind
  def self.run
    Mastermind.new.start
  end

  def initialize
    puts "Welcome to Mastermind"
    input = gets.strip
    case input
    when 'p' then play
    end
  end

  def play
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end
end

mastermind = Mastermind.new

sanitize input
classes to extract
how to deal with a guess


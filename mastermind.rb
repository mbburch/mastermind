class Mastermind

  attr_accessor :guess

  def initialize
    puts welcome_message
    initial_input
  end

  def welcome_message
    "Welcome to Mastermind.\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def initial_input
    input = gets.strip
    case input
    when 'play', 'p' then play
    when 'instructions', 'i' then instructions
    when 'quit', 'q' then quit
    end
  end

  def play
    secret_code
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    take_turn
  end

  def instructions
    puts "I will generate a sequence with four elements made up of different colors. Your job is
    to guess the correct sequence in as few turns as possible. I will give you hints each turn
    to help you narrow it down. To play, press p or type play. To quit, press q or type quit."
    initial_input
  end

  def quit
    puts "Thanks for playing."
  end

  def take_turn
    @guess = gets.strip.downcase
    case guess
    when 'q', 'quit'
      quit
    when 'c', 'cheat'
      print_secret_code
    when guess.length < 4
      puts "Guess must be 4 characters. Guess again."
    when guess.length > 4
      puts "Guess must be 4 characters. Guess again."
    when correct_guess
      end_game_flow
    when guess.length == 4
      puts "#{guess} has #{correct_elements} of the correct_elements with
       #{correct_placement} in the correct positions. You've taken #{guesses}.
        Guess again."
    else
      raise 'hell'
    end
  end

  def secret_code
    chars = %w(r g b y)
    code_array = [chars.sample, chars.sample, chars.sample, chars.sample]
    code = code_array.join
  end

  def print_secret_code
    puts secret_code
  end

  def correct_elements
    amount = 0
    4.times do |char|
      amount += 1 if secret_code.include?(guess[char])
    end
  end

  def correct_placement
    amount = 0
    4.times do |char|
      amount += 1 if guess[char] == secret_code[char]
    end
    amount
  end

  def guesses
  end

  def correct_guess
    guess == secret_code
  end

  def end_game_flow
  end
end




mastermind = Mastermind.new

# sanitize input
# classes to extract
# how to deal with a guess


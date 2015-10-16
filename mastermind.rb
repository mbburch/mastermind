class Mastermind

  attr_accessor :guess, :secret_code

  def initialize
    @secret_code = get_code
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
    else
      initialize
    end
  end

  def play
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
    @guess_counter = 0
    until @guess == ('q' || 'quit') || (correct_guess)
      @guess = gets.strip.downcase
      if @guess == ('q' || 'quit')
        quit
      elsif @guess == ('c' || 'cheat')
        print_secret_code
        puts "Cheater! But go ahead if you must."
      elsif @guess.length < 4
        puts "Guess must be 4 characters. Guess again."
      elsif @guess.length > 4
        puts "Guess must be 4 characters. Guess again."
      elsif correct_guess
        end_game_flow
      elsif (@guess.length == 4) && (!correct_guess)
        puts "#{@guess} has #{correct_elements} matching elements with
         #{correct_placement} in the correct positions. You've taken #{@guess_counter} guesses.
          Guess again."
      end
      @guess_counter += 1
    end
  end

  def get_code
    chars = %w(r g b y)
    code_array = [chars.sample, chars.sample, chars.sample, chars.sample]
    code = code_array.join
  end

  def print_secret_code
    puts @secret_code
  end

  def correct_elements
    amount = 0
    4.times do |char|
      amount += 1 if @secret_code.include?(@guess[char])
    end
    amount
  end

  def correct_placement
    amount = 0
    4.times do |char|
      amount += 1 if @guess[char] == @secret_code[char]
    end
    amount
  end

  def correct_guess
    @guess == @secret_code
  end

  def end_game_flow
    puts "You won!"
  end
end

mastermind = Mastermind.new

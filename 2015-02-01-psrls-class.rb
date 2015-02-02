require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"


# Class: PSRLS_rules
#
# Contains the rules and methods for judging a game of PSRLS based on those rules  
#
# Attributes:
# @app_name1      - String: represents the player's name
# @app_name2      - String: represents the other player's name 
# @player1        - Object: instantiation of class Player
# @player2        - Object: another instantiation of class Player
# @possible_moves - Array: holds all valid moves for PSR
#
# Public Methods:
# #check_if_moves_are_valid
# #judge_game
# #print_rules

class PSRLS_rules
  
  # Private: #initialize
  # Establishes primary instance variables when you instantiate the class.
  #
  # Parameters:
  # @app_name1 - name of the new player
  # @app_name2 - name of the new player
  # @player1   - Object: instantiation of class Player
  # @player2   - Object: another instantiation of class Player
  #
  # Returns:
  # Instantiation of PSRLS_rules
  #
  # State Changes:
  # Sets @app_name1, @app_name2, @player1, @player2 and @possible_moves
  
  def initialize(app_name1, app_name2, player1, player2)
    @app_name1 = app_name1
    @app_name2 = app_name2
    @player1 = player1
    @player2 = player2
    @possible_moves = ["paper", "rock", "scissors", "lizard", "spock"]
  end
  
  # Public: #print_rules
  # Outputs the rules to the console if a player requests them.
  #
  # Parameters:
  # None
  #
  # Returns:
  # Nil
  #
  # State Changes:
  # None
  
  def print_rules
    puts "Do you need a refresher on the rules? Y or N."
    answer = gets.chomp.downcase

    if answer == "y"
      puts "RULES:"
      puts "So the premise is simple, if naturally more complicated than Paper, Scissors, Rock."
      puts "Each player chooses one of five items (paper, scissors, rock, lizard or spock)."
      puts "- Rock mangles scissors and crushes lizard."
      puts "- Scissors cuts paper and decapitates lizard."
      puts "- Paper covers rock and disproves spock."
      puts "- Lizard poisons spock and eats paper."
      puts "- Spock smashes scissors and vaporizes rock."
      puts ""
    end
  end
  
  # Public: #check_if_moves_are_valid
  # Analyzes the players' moves and looks to see if they're valid; if not, assigns a win to whoever gave a valid move.
  #
  # Parameters:
  # move1 = Player 1's move
  # move2 = Player 2's move
  #
  # Returns:
  # Nil
  #
  # State Changes:
  # Updates @scoresheet from the Player class
  
  def check_if_moves_are_valid(move1, move2)
    @move1 = move1
    @move2 = move2
    
    if @possible_moves.include?(@move2) == false && @possible_moves.include?(@move1) == false
      puts "RESULT: You're both hopeless. EVERYONE LOSES. (Except for me.)"
    elsif @possible_moves.include?(@move2) == false
      puts "RESULT: I know this is more complicated than PSR, but it's not THAT hard. Again, your options: paper, scissors, rock, lizard or spock. That's it, #{@app_name2}. None of this \"#{@move1}\" nonsense. #{@app_name1.capitalize} wins by default."
      @player1.add_win(1)
    elsif @possible_moves.include?(@move1) == false
      puts "RESULT: Dude, you have a lot of options, but #{@move1} isn't one of them. Paper, scissors, rock, lizard or spock. #{@app_name2.capitalize} wins by default."
      @player2.add_win(1)
    end
  end 
  
  # Public: #judge_game
  # Analyzes the players' moves and determins the winner, communicating the winner via the add_win or add_tie method from the Player class
  #
  # Parameters:
  # move1 = Player 1's move
  # move2 = Player 2's move
  #
  # Returns:
  # Nil
  #
  # State Changes:
  # Updates @scoresheet from the Player class
  
  def judge_game(move1, move2)
    @move1 = move1
    @move2 = move2
    
    if @move1 == @move2
      puts "RESULT: How unoriginal. It's a tie."
      @player1.add_tie(1)
      @player2.add_tie(1)
    elsif @move1 == "paper"
      if @move2 == "rock"
        puts "RESULT: #{@app_name1}, you are a CHAMP. A champ, I say. Would you like to be the guest of honor at my next dinner party? (#{@app_name2.capitalize}, you're not invited."
        @player1.add_win(1)
      elsif @move2 == "scissors"
        puts "RESULT: You know that scene from 'Titanic' where the dude screams, 'I'm the king of the world!' at the bow of the ship? #{@app_name2.capitalize}, you're that guy. #{@app_name1}? You drowned, alone and forgotten."
        @player2.add_win(1)
      elsif @move2 == "lizard"
        puts "RESULT: #{@app_name1}, you're like a box of Wheaties, because #{@app_name2} is a champion who just ate you for breakfast."
        @player2.add_win(1)
      elsif @move2 == "spock"
        puts "RESULT: Have you ever thought of a career in reality TV, #{@app_name2}? Because you're \"The Biggest Loser\"."
        @player1.add_win(1)
      end
    elsif @move1 == "rock"
      if @move2 == "scissors"
        puts "RESULT: #{@app_name2}, they should call you Battlestar Pegasus for the way you've been obliterated. #{@app_name1.capitalize} wins!"
        @player1.add_win(1)
      elsif @move2 == "paper"
        puts "RESULT: #{@app_name2}, you DESTROYED #{@app_name1} with the fierce fury of your dried wood pulp."
        @player2.add_win(1)
      elsif @move2 == "lizard"
        puts "RESULT: #{@app_name1} just crushed it. Literally."
        @player1.add_win(1)
      elsif @move2 == "spock"
        puts "RESULT: For dust thou art, #{@app_name1}, and unto dust thou has returned."
        @player2.add_win(1) 
      end
    elsif @move1 == "scissors"
      if @move2 == "rock"
        puts "RESULT: #{@app_name2.upcase} SMASH. #{@app_name1.upcase} LOSE."
        @player2.add_win(1)
      elsif @move2 == "paper"
        puts "RESULT: Really? Who actually picks 'paper'? No wonder that #{@app_name1} cut through that stationary like Leslie Knope through Pawnee's bureaucratic red tape."
        @player1.add_win(1)
      elsif @move2 == "lizard"
        puts "RESULT: At this rate, #{@app_name2}, you're never going to get \"a head\" in life. (Get it? Get it? Get it?) #{@app_name1.capitalize} wins!"
        @player1.add_win(1)
      elsif @move2 == "spock"
        puts "RESULT: Frankly, I think scissors should totally be able to stab Spock, but what do I know. Pointy ears: 1. Pointy blades: 0."
        @player2.add_win(1)
      end
    elsif @move1 == "lizard"
      if @move2 == "rock"
        puts "RESULT: #{@app_name2} just crushed your lizard in the gizzard. (Like a wizard. Who uses rocks instead of spells.)"
        @player2.add_win(1)
      elsif @move2 == "paper"
        puts "RESULT: ."
        @player1.add_win(1)
      elsif @move2 == "scissors"
        puts "RESULT: At this rate, #{@app_name1}, you're never going to get \"a head\" in life. (Get it? Get it? Get it?) #{@app_name2.capitalize} wins!"
        @player2.add_win(1)
      elsif @move2 == "spock"
        puts "RESULT: #{@app_name2}, you're like Vizzini, and #{@app_name1} is like Wesley. Meaning #{@app_name2}, you're totally dead."
        @player1.add_win(1)
      end
    elsif @move1 == "spock"
      if @move2 == "rock"
        puts "RESULT: RESULT: For dust thou art, #{@app_name2}, and unto dust thou has returned."
        @player1.add_win(1)
      elsif @move2 == "paper"
        puts "RESULT: This battle is like the equivalent of #{@app_name2} going, \"Neener neener neener!!\" to #{@app_name1}. But apparently that's a valid form of weaponry in this strange, strange world."
        @player2.add_win(1)
      elsif @move2 == "lizard"
        puts "RESULT: #{@app_name1}, have you been hanging out with Bret Michaels? Because you just got POISONED!!!11"
        @player2.add_win(1)
      elsif @move2 == "scissors"
        puts "RESULT: For a game with Spock as a main feature, PSRLS is highly flawed from a logic standpoint. Spock \"smashing\" scissors is just silly, but I guess it's no worse than paper \"covering\" rock. So #{@app_name1}, your point."
        @player1.add_win(1)
      end
    end
  end
  
end
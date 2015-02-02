require "pry"
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"
require_relative "2015-01-29-rules-class.rb"


# Class: PSR_rules
#
# Contains the rules and methods for judging a game of PSR based on those rules  
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

class PSR_rules
  
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
  # Instantiation of PSR_rules
  #
  # State Changes:
  # Sets @name, @victories and @moves
  
  def initialize(app_name1, app_name2, player1, player2)
    @app_name1 = app_name1
    @app_name2 = app_name2
    @player1 = player1
    @player2 = player2
    @possible_moves = ["paper", "rock", "scissors"]
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
      puts "So the premise is simple (if deeply flawed): Each player chooses one of three items (rock, paper or scissors)."
      puts "- Rock beats scissors (makes sense)."
      puts "- Scissors cut paper (sure, I can accept that)."
      puts "- Paper covers rock (in the words of Flula, this just doesn't make sense:"
      puts "\"This help a rock. Rock does not now have sunburn, rock can have bad hair day, and paper has helped out.\")"
      puts "So each player selects their item, and then we see who wins!"
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
      puts "RESULT: \"#{@move2}\"???? P-a-p-e-r, s-c-i-s-s-o-r-s or r-o-c-k. That's it, #{@app_name2}. #{@app_name1.capitalize} wins by default of your incompetence."
      @player1.add_win(1)
    elsif @possible_moves.include?(@move1) == false
      puts "RESULT: Dude, your only options are p-a-p-e-r, s-c-i-s-s-o-r-s or r-o-c-k. None of this \"#{@move1}\" nonsense. #@app_name2.capitalize} wins because duh."
      @player2.add_win(1)
    end
  end 
  
  # Public: #judge_game
  # Analyzes the players' moves and determins the winner, communicating the winner via the add_win or add_tie method from the 
  # Player class
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
      @player2.add_tie(2)
    elsif @move1 == "paper"
      if @move2 == "rock"
        puts "RESULT: #{@app_name1.capitalize}, you are a CHAMP. A champ, I say. Would you like to be the guest of honor at my next dinner party? (#{@app_name2.capitalize}, you're not invited."
        @player1.add_win(1)
      elsif @move2 == "scissors"
        puts "RESULT: You know that scene from 'Titanic' where the dude screams, 'I'm the king of the world!' at the bow of the ship? #{@app_name2.capitalize}, you're that guy. #{@app_name1}? You drowned, alone and forgotten."
        @player2.add_win(1)
      end
    elsif @move1 == "rock"
      if @move2 == "scissors"
        puts "RESULT: #{@app_name2.capitalize}, they should call you Battlestar Pegasus for the way you've been obliterated. #{@app_name1.capitalize} wins!"
        @player1.add_win(1)
      elsif @move2 == "paper"
        puts "RESULT: #{@app_name2.capitalize}, you DESTROYED #{@app_name1} with the fierce fury of your dried wood pulp."
        @player2.add_win(1)
      end
    elsif @move1 == "scissors"
      if @move2 == "rock"
        puts "RESULT: #{@app_name2.upcase} SMASH. #{@app_name1.upcase} LOSE."
        @player2.add_win(1)
      elsif @move2 == "paper"
        puts "RESULT: Really? Who actually picks 'paper'? No wonder that #{@app_name1} cut through that stationary like Leslie Knope through Pawnee's bureaucratic red tape."
        @player1.add_win(1)
      end
    end
  end
  
end

binding.pry
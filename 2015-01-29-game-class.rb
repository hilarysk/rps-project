require "pry"
require_relative "2015-01-29-rps-player-class.rb"

# Class: Game
#
# Contains the methods for actually playing PSR  
#
# Attributes:
# @app_name1 - String: represents the player's name
# @app_name2 - String: represents the other player's name 
# @player1   - Object: instantiation of class Player
# @player2   - Object: another instantiation of class Player
#
# Public Methods:
# best_of_loop
# collect_moves
# add_moves
# result
# print_rules


class Game < Player
  
  attr_accessor :app_name1, :app_name2, :player1, :player2
  
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
  # ?
  #
  # State Changes:
  # Sets @name, @victories and @moves
  
  def initialize(app_name1, app_name2, player1, player2)
    @app_name1 = app_name1
    @app_name2 = app_name2
    @player1 = player1
    @player2 = player2 
  end
  
  # Public: #best_of_loop
  # Sets up loop to play game until number of rounds specified by players has been reached and a player has 
  # won at least half of the games. 
  #
  # Parameters:
  # match_num - Number of games they want to play
  # game      - Instatiation of the Game class
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def best_of_loop(match_num, game)
    winner = ((match_num / 2) + 1).ceil
    until @player1.add_win == winner || @player2.add_win == winner
      game.collect_moves
      game.add_moves
      game.result
    end
  end
  
  # Public: #collect_moves
  # Gets moves from the players
  #
  # Parameters:
  # None
  #
  # Returns:
  # value of move2?
  #
  # State Changes:
  # Creates instance variables @move1 and @move2 and assigns values to them
    
  def collect_moves
    puts "#{app_name1}, what's your move?"
    @move1 = gets.chomp.downcase
    puts "#{app_name2}, what's your move?"
    @move2 = gets.chomp.downcase
  end  
  
  # Public: #add_moves
  # Adds players' moves to their @moves arrays
  #
  # Parameters:
  # None
  #
  # Returns:
  # @moves array for @player2?
  #
  # State Changes:
  # Updates @moves array
  
  def add_moves
    @player1.move_total(@move1)
    @player2.move_total(@move2)
  end
    
  # Public: #result
  # Figure out who won each round and adds result to @score_sheet array
  #
  # Parameters:
  # None
  #
  # Returns:
  # Depends on which if statement evaluates to true. ?
  #
  # State Changes:
  # Changes @score_sheet array
  
  def result  
      if ((@move2 != "rock" && @move2 != "scissors") && @move2 != "paper") && ((@move1 != "rock" && @move1 != "scissors") && @move1 != "paper")
      puts "RESULT: You're both hopeless. EVERYONE LOSES. (Except for me.)" 

    elsif (@move1 != "rock" && @move1 != "scissors") && @move1 != "paper"
      puts "RESULT: Dude, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{@move1}\" nonsense. #{@app_name2} wins because duh."
      @player2.add_win(1)

    elsif (@move2 != "rock" && @move2 != "scissors") && @move2 != "paper"
      puts "RESULT: \"#{@move2}\"???? P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. That's it, #{@app_name2}. #{@app_name1} wins by default of your incompetence."
      @player1.add_win(1)
    
    elsif @move1 == @move2
      puts "RESULT: How unoriginal. It's a tie."
      @player1.add_tie(1)
      @player2.add_tie(1)

    elsif @move1 == "rock" && @move2 == "paper"
      puts "RESULT: #{@app_name2}, you DESTROYED #{@app_name1} with the fierce fury of your .... paper."
      @player2.add_win(1)

    elsif @move1 == "rock" && @move2 == "scissors"
      puts "RESULT: #{@app_name2}, they should call you Battlestar Pegasus for the way you've been obliterated. #{@app_name1} wins!"
      @player1.add_win(1)

    elsif @move1 == "paper" && @move2 == "rock"
      puts "RESULT: #{@app_name1}, you are a CHAMP. A champ, I say. Would you like to be the guest of honor at my next dinner party? (#{@app_name2}, you're not invited.)"
      @player1.add_win(1)

    elsif @move1 == "paper" && @move2 == "scissors"
      puts "RESULT: You know that scene from 'Titanic' where the dude screams 'I'm the king of the world!' at the bow of the ship? #{@app_name2}, you're that guy. #{@app_name1}? You drowned, alone and forgotten."
      @player2.add_win(1)
      
    elsif @move1 == "scissors" && @move2 == "paper"
      puts "RESULT: Really? Who actually picks 'paper'? No wonder that #{@app_name1} cut through that stationary like Leslie Knope through Pawnee's bureaucratic red tape."
      @player1.add_win(1)

    elsif @move1 == "scissors" && @move2 == "rock"
      puts "RESULT: #{@app_name2.upcase} SMASH. #{@app_name1.upcase} LOSE."
      @player2.add_win(1)
      
    else
    end
  end
  
  # Public: #print_rules
  # Outputs the rules to the console if a player requests them.
  #
  # Parameters:
  # None
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def print_rules
    puts "So the premise is simple (if deeply flawed): Each player chooses one of three items (rock, paper or scissors)."
    puts "- Rock beats scissors (makes sense)."
    puts "- Scissors cut paper (sure, I can accept that)."
    puts "- Paper covers rock (in the words of Flula, this just doesn't make sense:"
    puts "\"This help a rock. Rock does not now have sunburn, rock can have bad hair day, and paper has helped out.\")"
    puts "So each player selects their item, and then we see who wins!"
    puts ""
  end
  
end
  



  
binding.pry
  
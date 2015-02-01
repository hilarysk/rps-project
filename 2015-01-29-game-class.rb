
# 3. The Game class is still doing too much (running the game, comparing player moves, etc.). Let’s create a Rules class to which we can delegate the job of comparing moves to determine the round winner, and to which we can delegate the job of holding the list of valid moves. This means that neither the Game class nor the Player class will have to know anything about the rules of the game; they'll only have to be able to prompt the Rules class to settle things.


require "pry"
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-rules-class.rb"

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
# #get_match_num
# #best_of_loop
# #collect_moves
# #add_moves
# #result
# #print_rules
# #print_move_array


class Game < Player
  
  attr_accessor :app_name1, :app_name2, :player1, :player2 :rules_instance
  
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
  
  def initialize(app_name1, app_name2, player1, player2, rules_instance)
    @app_name1 = app_name1
    @app_name2 = app_name2
    @player1 = player1
    @player2 = player2 
    @rules_instance = rules_instance
  end
  
  # Public: #play_game
  # Basically a method of methods - runs the Game class methods in the proper order
  #
  # Parameters:
  # this_game - The instantiation of Game class being used in the driver (app.rb)
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def play_game(game_instance)
    @game_instance = game_instance
    @rules_instance.print_rules
    @game_instance.get_match_num
    @game_instance.best_of_loop
    @game_instance.deliver_results
    @game_instance.print_move_array
  end
    
  # Public: #get_match_num
  # Gets integer from user regarding how many games they want to play.
  #
  # Parameters:
  # None
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def get_match_num
    print "All right, what are we thinking? Best out of 3? Best out of 6? Give me a number:"
    @match_num = gets.chomp.to_i

    until @match_num > 0
      print "Has to be a number bigger than 0 (duh):"
      @match_num = gets.chomp.to_i
    end
  end
  
  # Public: #best_of_loop
  # Sets up loop to play game until number of rounds specified by players has been reached and a player has 
  # won at least half of the games. 
  #
  # Parameters:
  # game - Instatiation of the Game class
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def best_of_loop
    winner = ((@match_num / 2) + 1).ceil
    until @player1.add_win == winner || @player2.add_win == winner
      @game_instance.collect_moves
      @game_instance.add_moves
      @rules_instance.judge_game(@move1, @move2, @app_name1, @app_name2)
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
    

       
       
  
  # Public: #deliver_results
  # Outputs the results to the console
  #
  # Parameters:
  # None
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def deliver_results
    puts ""
    puts "Game over! Final scores:"
    puts "#{@app_name1}:\nWins: #{@player1.add_win}, Ties: #{@player1.add_tie}."
    puts ""
    puts "#{@app_name2}:\nWins: #{@player2.add_win}, Ties: #{@player2.add_tie}."
  end
  
  # Public: #print_move_array
  # Outputs the moves each player made to the console if the player wants.
  #
  # Parameters:
  # None
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def print_move_array
    puts "Want to see which moves you made? Y or N."
    move_answer = gets.chomp.downcase

    if move_answer == "y"
      puts "#{@app_name1}, you played #{@player1.show_move_total}."
      puts "#{@app_name2}, you played #{@player2.show_move_total}."
      puts ""
      puts "Thanks for playing!"
    else
      puts "No problem. Thanks for playing!"
    end
  end
  
end
  



  
binding.pry
  
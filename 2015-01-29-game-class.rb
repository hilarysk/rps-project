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
# #get_game_choice
# #instantiate_rules
# #get_match_num
# #best_of_loop
# #collect_moves
# #add_moves
# #result
# #print_rules
# #print_move_array

class Game < Player
  
  attr_accessor :app_name1, :app_name2, :player1, :player2, :rules_instance
  
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
  # Instantiation of Game
  #
  # State Changes:
  # Sets @name, @victories and @moves
  
  def initialize(app_name1, app_name2, player1, player2)
    @app_name1 = app_name1
    @app_name2 = app_name2
    @player1 = player1
    @player2 = player2 
  end
  
  # Public: #get_game_choice
  # Asks user which game they want to play (setting up )
  #
  # Parameters:
  # None
  #
  # Returns:
  # Nil
  #
  # State Changes:
  # Sets the value for @game_choice

  def get_game_choice
    puts "What game would you like to play?"
    puts "For Paper Scissors Rock, type 1 and hit enter."
    #puts "For Tic-Tac-Toe, type 2 and hit enter."
    #puts "For Paper, Scissors, Rock, Lizard, Spock, type 3 and hit enter."

    @game_choice = gets.chomp.to_i
    
      until @game_choice == 1 #|| @game_choice == 2 || game_choice == 3
        puts "Oops, let's try again. Enter \"1\" for Paper Scissors Rock" #"or \"2\" for Tic-Tac-Toe or \"3\" for Paper, 
        @game_choice = gets.chomp.to_i                                    #Scissors, Rock, Lizard, Spock:"
      end
  end
  
  # Public: #instantiate_rules
  # Creates an instance of whichever Rules class is necessary to play the game selected by the users
  #
  # Parameters:
  # None
  #
  # Returns:
  # Instantiation of a Rules class
  #
  # State Changes:
  # Sets the value for @rules_instance

  def instantiate_rules
    if @game_choice == 1
      @rules_instance = PSR_rules.new(@app_name1, @app_name2, @player1, @player2)
    else 
      @rules_instance = TTT_rules.new
    end
  end
  
  # Public: #play_game
  # Basically a method of methods - runs the Game class methods in the proper order
  #
  # Parameters:
  # game_instance - The instantiation of Game class being used in the driver (app.rb)
  #
  # Returns:
  # Nil
  #
  # State Changes:
  # Sets the value for @game_instance
  
  def play_game(game_instance)
    @game_instance = game_instance
    @game_instance.get_game_choice
    @game_instance.instantiate_rules
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
  # Nil
  #
  # State Changes:
  # Sets @match_num
  
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
  # Nil
  #
  # State Changes:
  # None
  
  def best_of_loop
    winner = ((@match_num / 2) + 1).ceil
    until @player1.add_win == winner || @player2.add_win == winner
      @game_instance.collect_moves
      @game_instance.add_moves
      @rules_instance.check_if_moves_are_valid(@move1, @move2)
      @rules_instance.judge_game(@move1, @move2)
    end
  end

  # Public: #collect_moves
  # Gets moves from the players
  #
  # Parameters:
  # None
  #
  # Returns:
  # Nil
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
  # ?
  #
  # State Changes:
  # Updates @moves array in the Player class
  
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
  # Nil
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
  # Nil
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
  
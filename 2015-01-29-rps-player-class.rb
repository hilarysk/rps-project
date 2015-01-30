require "pry" 

# Class: Player
#
# Creates a player and sets their win total to 0; also creates hash to store moves. 
#
# Attributes:
# @name      - Instance variable: represents the player's name
# @victories - Hash: stores the player's total number of wins (initialized to 0) as the value to player 
#              name key
# @moves     - Hash: stores the player's moves in an array as the value to the player name key
#
# Public Methods:
# #move_total
# #victory_total

class Player
  
  # Private?: #initialize
  # Establishes primary instance variables when you instantiate the class.
  #
  # Parameters:
  # name - name of the new player
  #
  # Returns:
  # ?
  #
  # State Changes:
  # Sets @name, @victories and @moves

  attr_accessor :name, :victories, :moves
  
  def initialize(name)
    @name = name
    
    @victories = {}
    @victories[@name] = 0  
    
    @moves = {}
    @moves[@name] = []             
  end
  
  # Public: #move_total
  # Updates the array that occupies the value spot in the @moves hash
  #
  # Parameters:
  # move - A string of the move the player made
  #
  # Returns:
  # The value for @moves hash
  #
  # State Changes:
  # Changes the value in @moves hash
  
  def move_total(move)
    @individual_move = move.to_s
    @moves[@name] = @individual_move.push
    return @moves
  end
  
  
  def show_move_total
    return @moves[@name]
  end
  
  # Public: #victory_total
  # Updates the @victories value for the corresponding member player_name
  #
  # Parameters:
  # win_num - Amount by which @victories value should increase
  #
  # Returns:
  # The player's total number of wins
  #
  # State Changes:
  # Changes the value of @victories
  
  def victory_total(win_num=0)
    @victories[@name] += win_num.abs.to_i
    return @victories[@name]
  end
 
  
end

binding.pry
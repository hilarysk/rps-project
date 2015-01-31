require "pry" 

# Class: Player
# Creates a player and sets their win total to 0; also creates hash to store moves. 
#
# Attributes:
# @name        - Instance variable: represents the player's name
# @score_sheet - Hash: stores the player's total number of wins (initialized to 0) and number of ties 
#                (initialized to 0)
# @moves       - Array: stores the player's moves
# @wins        - Integer: represents the number of wins
# @ties        - Integer: represents the number of ties
#
# Public Methods:
# #move_total
# #show_move_total
# #add_win
# #add_tie

class Player
  
  # Private: #initialize
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
    @wins = 0
    @ties = 0
    @score_sheet = {:wins=>@wins, :ties=>@ties}
    @moves = []            
  end
  
  # Public: #move_total
  # Updates the array that occupies the value spot in the @moves array
  #
  # Parameters:
  # move - A string of the move the player made
  #
  # Returns:
  # The value for @moves hash
  #
  # State Changes:
  # Changes the value in @moves array
  
  def move_total(move)
    @moves.push(move)
    return @moves
  end
  
  # Public: #show_move_total
  # Returns a formatted list of the items contained in the @moves array
  #
  # Parameters:
  # None
  #
  # Returns:
  # A formatted list of the items contained in the @moves array
  #
  # State Changes:
  # None
  
  def show_move_total
    @moves.join(", ")
  end
  
  # Public: #add_win
  # Updates the :wins value for the @score_sheet hash
  #
  # Parameters:
  # win_num - Amount by which the win tally should increase
  #
  # Returns:
  # The player's total number of wins
  #
  # State Changes:
  # Changes the value of @scoresheet[:wins]
  
  def add_win(win_num=0)
    @score_sheet[:wins] += win_num.abs.to_i
    return @score_sheet[:wins]
  end
  
  # Public: #add_tie
  # Updates the :ties value for the @score_sheet hash
  #
  # Parameters:
  # tie_num - Amount by which the tie tally should increase
  #
  # Returns:
  # The player's total number of ties
  #
  # State Changes:
  # Changes the value of @scoresheet[:ties]
  
  def add_tie(tie_num=0)
    @score_sheet[:ties] += tie_num.abs.to_i
    return @score_sheet[:ties]
  end
end

binding.pry
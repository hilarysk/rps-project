require "pry"

# Class: Player
#
# Creates specific player and sets their win tally to 0. 
#
# Attributes:
# @name        - Instance variable: represents the player's name
# @victory_total - Instance variable: represents the player's total number of wins (initialized to 0)
#
# Public Methods:
# #victory_total

class Player
  
  # Private?: #initialize
  # Establishes primary instance variables when you instantiate the class.
  #
  # Parameters:
  # name - name of the new player
  #
  # Returns:
  # the value of @name and @victoryvictory_total
  #
  # State Changes:
  # Sets @name and @victoryvictory_total
  
  attr_accessor :name, :victory_total 
  
  def initialize(name)             
    @name = name                       
    @victory_total = 0
  end
  
  
  # Public: #add_victory
  # Updates the @victory_total instance variable for the corresponding member @name
  #
  # Parameters:
  # win_num - integer by which @victory_total should increase
  #
  # Returns:
  # The new value of @victory_total?
  #
  # State Changes:
  # Changes the value of @victory_total
  
  def add_victory(win_num)
    @victory_total += win_num.to_f.abs
  end
  
  
end

binding.pry
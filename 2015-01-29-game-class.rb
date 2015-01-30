require "pry"
require "2015-01-29-rps-player-class.rb"


                    # 3. Players should be able to play a best-of-n match, which will require you to keep track of each player’s score.
                    # 4. Go back and provide method documentation for all of your classes and custom-written methods. If you wrote the class (or method), you gotta document it.



# Class: Game
#
# Creates a game and  
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

class Game
    
  # Public: #are_moves_acceptable
  # See if moves entered fit the criteria for PSR
  #
  # Parameters:
  # move1 - A string of the move a player made
  # move2 - A string of the move the other player made
  #
  # Returns:
  # The values for @move1 and @move2
  #
  # State Changes:
  # Establishes @move1 and @move2
  
  def are_moves_acceptable(move1, move2)
    @move1 = move1
    @move2 = move2
    
    if ((@move2 != "rock" && @move2 != "scissors") && @move2 != "paper") && ((@move1 != "rock" && @move1 != "scissors") && @move1 != "paper")
      print "You're both hopeless. EVERYONE LOSES. (Except for me.)"

    elsif (@move1 != "rock" && @move1 != "scissors") && @move1 != "paper"
      print "Dude, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{@move1}\" nonsense. Player 2 wins by default."

    elsif (@move2 != "rock" && @move2 != "scissors") && @move2 != "paper"
      print "\"#{@move2}\"???? P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. That's it, Player 2. Player 1 wins by default."
    else 
    end
    return @move1, @move2
  end
  
  
  def who_wins
    # create matrix? hash w/in hash (first move = key, second move possibilities = value (another hash))
  end

  
  def wins_needed_met(win_num)
    #has to be odd (check for in app.rb)
    #
  end

  
  
  def print_rules
    
    # write something nice and snarky here
  end
  
  


  
  # if @move1 == @move2
  #   print "It's a tie!"
  #
  # elsif @move1 == "rock" && @move2 == "paper"
  #   print "Player 2 wins!"
  #
  # elsif @move1 == "rock" && @move2 == "scissors"
  #   print "Player 1 wins!"
  #
  # elsif @move1 == "paper" && @move2 == "rock"
  #   print "Player 1 wins!"
  #
  # elsif @move1 == "paper" && @move2 == "scissors"
  #   print "Player 2 wins!"
  #
  # elsif @move1 == "scissors" && @move2 == "paper"
  #   print "Player 1 wins!"
  #
  # elsif @move1 == "scissors" && @move2 == "rock"
  #   print "Player 2 wins!"
  #
  
end
  



  
binding.pry
  
require "pry"
require "2015-01-29-rps-player-class.rb"


# 3. Players should be able to play a best-of-n match, which will require you to keep track of each player’s score.
# 4. Go back and provide method documentation for all of your classes and custom-written methods. If you wrote the class (or method), you gotta document it.


class Game
  def initialize(move1, move2)
    @move1 = move1
    @move2 = move2
  end
  
  
  def are_moves_acceptable
    if ((@move2 != "rock" && @move2 != "scissors") && @move2 != "paper") && ((@move1 != "rock" && @move1 != "scissors") && @move1 != "paper")
      print "You're both hopeless. EVERYONE LOSES. (Except for me.)"

    elsif (@move1 != "rock" && @move1 != "scissors") && @move1 != "paper"
      print "Um, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{@move1}\" nonsense. Player 2 wins by default."

    elsif (@move2 != "rock" && @move2 != "scissors") && @move2 != "paper"
      print "Um, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{@move2}\" nonsense. Player 1 wins by default."
    else 
  end
  
  def who_wins
  end
  
  def print_rules
  end

  #REALLY NOT SURE WHAT METHODS TO DO NOW ... DO I NEED TO MAKE SOME OF THIS INTO METHODS HERE?
  
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

  #
  # else
  #   print "Something went wrong ... we're sending the space monkeys into the computer to try and fix it."
  # end
 
  

  
  
  

  
end
  



  
binding.pry
  
require "pry"


# # Level 0 is where we get things working at their most basic level.
#
# 2. Player classes + overall driver method. Driver method should create players, tell the players to prompt for moves, and determine the winner. Players should keep track of their names and moves, and should still only accept valid moves. From the user’s perspective, the game should appear to work exactly the same.
# 3. Players should be able to play a best-of-n match, which will require you to keep track of each player’s score.
# 4. Go back and provide method documentation for all of your classes and custom-written methods. If you wrote the class (or method), you gotta document it.

class Player
  def initialize 
    @scores = {}
    @moves = {}
  end
  
  def add_player(name)
    player = name.to_sym
    @scores[player] = 0
  end
  
  def make_move(name, *move) #this populates array, but still need to compare moves against each other.  
    player = name.to_sym
    @moves[player] = move
    puts @moves
  end
  
  def judge_moves #must put score into @scores
  end
  
  def score_history
  end
  
  def move_history
  end
  
end
  
  

# puts "Player 1, what's your move?"
#   move_1 = gets.chomp.downcase
#
# puts "Player 2, what's your move?"
#   move_2 = gets.chomp.downcase
#
#   puts "PAPER, SCISSORS, ROCK SHOWDOWN"
#   puts ""
#
#   if move_1 == move_2
#     print "It's a tie!"
#
#   elsif move_1 == "rock" && move_2 == "paper"
#     print "Player 2 wins!"
#
#   elsif move_1 == "rock" && move_2 == "scissors"
#     print "Player 1 wins!"
#
#   elsif move_1 == "paper" && move_2 == "rock"
#     print "Player 1 wins!"
#
#   elsif move_1 == "paper" && move_2 == "scissors"
#     print "Player 2 wins!"
#
#   elsif move_1 == "scissors" && move_2 == "paper"
#     print "Player 1 wins!"
#
#   elsif move_1 == "scissors" && move_2 == "rock"
#     print "Player 2 wins!"
#
#   elsif  ((move_2 != "rock" && move_2 != "scissors") && move_2 != "paper") && ((move_1 != "rock" && move_1 != "scissors") && move_1 != "paper")
#     print "You're both hopeless. EVERYONE LOSES. (Except for me.)"
#
#   elsif (move_1 != "rock" && move_1 != "scissors") && move_1 != "paper"
#     print "Um, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{move_1}\" nonsense. Player 2 wins by default."
#
#   elsif (move_2 != "rock" && move_2 != "scissors") && move_2 != "paper"
#     print "Um, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{move_2}\" nonsense. Player 1 wins by default."
#
#   else
#     print "Something went wrong ... we're sending the space monkeys into the computer to try and fix it."
#   end

  
binding.pry
  
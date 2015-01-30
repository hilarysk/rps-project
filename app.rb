require "pry"
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"


# Driver - program that runs methods with limited input from players. 

puts "Player1, what's your name?"
name1 = gets.chomp.to_sym

puts "Player2, what's your name?"
name2 = gets.chomp.to_sym

# Theorectically, this will now pass to the arguments for the instantiation of the class and will thus populate the hashes for each player. 

player1 = Player.new(name1)
player2 = Player.new(name2)





# if move_1 == move_2
#   print "It's a tie!"
#
# elsif move_1 == "rock" && move_2 == "paper"
#   print "Player 2 wins!"
#
# elsif move_1 == "rock" && move_2 == "scissors"
#   print "Player 1 wins!"
#
# elsif move_1 == "paper" && move_2 == "rock"
#   print "Player 1 wins!"
#
# elsif move_1 == "paper" && move_2 == "scissors"
#   print "Player 2 wins!"
#
# elsif move_1 == "scissors" && move_2 == "paper"
#   print "Player 1 wins!"
#
# elsif move_1 == "scissors" && move_2 == "rock"
#   print "Player 2 wins!"
#
# elsif  ((move_2 != "rock" && move_2 != "scissors") && move_2 != "paper") && ((move_1 != "rock" && move_1 != "scissors") && move_1 != "paper")
#   print "You're both hopeless. EVERYONE LOSES. (Except for me.)"
#
# elsif (move_1 != "rock" && move_1 != "scissors") && move_1 != "paper"
#   print "Um, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{move_1}\" nonsense. Player 2 wins by default."
#
# elsif (move_2 != "rock" && move_2 != "scissors") && move_2 != "paper"
#   print "Um, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{move_2}\" nonsense. Player 1 wins by default."
#
# else
#   print "Something went wrong ... we're sending the space monkeys into the computer to try and fix it."
# end

binding.pry
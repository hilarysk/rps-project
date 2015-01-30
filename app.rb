require "pry"
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"


puts "Player 1, what's your name?"
name1 = gets.chomp.to_sym

puts "Player 2, what's your name?"
name2 = gets.chomp.to_sym


player1 = Player.new(name1)
player2 = Player.new(name2)


puts "Player1, what's your move?"
move1 = gets.chomp.downcase

puts "Player2, what's your move?"
move2 = gets.chomp.downcase

game = Game.new(move1, move2)

game.are_moves_acceptable


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

#
# else
#   print "Something went wrong ... we're sending the space monkeys into the computer to try and fix it."
# end

binding.pry
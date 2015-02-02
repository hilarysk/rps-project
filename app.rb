require "pry"
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"



# Get players' names

puts "Player 1, what's your name?"
app_name1 = gets.chomp

puts "Player 2, what's your name?"
app_name2 = gets.chomp

# Create two instantiations of Player class

player1 = Player.new(app_name1)
player2 = Player.new(app_name2)

# Instantiate Game class

game_instance = Game.new(app_name1, app_name2, player1, player2)

# Play game

game_instance.play_game(game_instance)


binding.pry
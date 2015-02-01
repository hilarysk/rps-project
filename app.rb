require "pry"
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"


# 3. The Game class is still doing too much (running the game, comparing player moves, etc.). Let’s create a Rules class to which we can delegate the job of comparing moves to determine the round winner, and to which we can delegate the job of holding the list of valid moves. This means that neither the Game class nor the Player class will have to know anything about the rules of the game; they'll only have to be able to prompt the Rules class to settle things.

# Establish which game to play

puts "What game would you like to play?"
puts "For Paper Scissors Rock, type 1 and hit enter."
#puts "For Tic-Tac-Toe, type 2 and hit enter."

game_choice = gets.chomp.to_i
until game_choice == 1 || game_choice == 2
  puts "Oops, let's try again. Enter \"1\" for Paper Scissors Rock or \"2\" for Tic-Tac-Toe:"
  game_choice = gets.chomp.to_i
end

# Create new instance for whichever game the users pick (Paper Scissors Rock or Tic-Tac-Toes)

if game_choice == 1
  rules_instance = PSR_rules.new
else 
  rules_instance = TTT_rules.new
end

# Establish players

puts "Player 1, what's your name?"
app_name1 = gets.chomp

puts "Player 2, what's your name?"
app_name2 = gets.chomp

player1 = Player.new(app_name1)
player2 = Player.new(app_name2)

game_instance = Game.new(app_name1, app_name2, player1, player2, rules_instance)

game_instance.play_game(game_instance)


binding.pry
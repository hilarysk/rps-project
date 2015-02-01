require "pry"
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"


# 1. The driver method is doing too much -- really, all it should do is create two players, tell them to play until they’re done (this should be a single method call), and then report the winner. Make this happen by way of creating a Game class; the driver method creates two players, creates the game, gives the players to the game, then tells the game to start. When the game is done, it reports its result back to the driver class. The only methods of the Game class that your driver should ever see are new and play. It is very likely that your Game class will have other methods, but the only methods that your driver should ever interact with are new and play.
# 2. As the Game class currently stands, both it and the players must know the rules for Rock-Paper-Scissors (players must know the list of possible moves, and the game must be able to determine who won a given round). Make it such that the Game class provides each player with a list of valid moves at the start of the game; then the players are responsible for simply making sure that whatever input they get from the user is included in that list of valid moves. Now the player objects don't need to know anything about the game they're playing other than the set of allowed moves.
# 3. The Game class is still doing too much (running the game, comparing player moves, etc.). Let’s create a Rules class to which we can delegate the job of comparing moves to determine the round winner, and to which we can delegate the job of holding the list of valid moves. This means that neither the Game class nor the Player class will have to know anything about the rules of the game; they'll only have to be able to prompt the Rules class to settle things.


# Establish players - could maybe make this part of initialize method? 

puts "Player 1, what's your name?"
app_name1 = gets.chomp

puts "Player 2, what's your name?"
app_name2 = gets.chomp

@player1 = Player.new(app_name1)
@player2 = Player.new(app_name2)

this_game = Game.new(app_name1, app_name2, @player1, @player2)

this_game.play_game(this_game)


binding.pry
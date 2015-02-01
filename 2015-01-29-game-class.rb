# 1. The driver method is doing too much -- really, all it should do is create two players, tell them to play until they’re done (this should be a single method call), and then report the winner. Make this happen by way of creating a Game class; the driver method creates two players, creates the game, gives the players to the game, then tells the game to start. When the game is done, it reports its result back to the driver class. The only methods of the Game class that your driver should ever see are new and play. It is very likely that your Game class will have other methods, but the only methods that your driver should ever interact with are new and play.
# 2. As the Game class currently stands, both it and the players must know the rules for Rock-Paper-Scissors (players must know the list of possible moves, and the game must be able to determine who won a given round). Make it such that the Game class provides each player with a list of valid moves at the start of the game; then the players are responsible for simply making sure that whatever input they get from the user is included in that list of valid moves. Now the player objects don't need to know anything about the game they're playing other than the set of allowed moves.
# 3. The Game class is still doing too much (running the game, comparing player moves, etc.). Let’s create a Rules class to which we can delegate the job of comparing moves to determine the round winner, and to which we can delegate the job of holding the list of valid moves. This means that neither the Game class nor the Player class will have to know anything about the rules of the game; they'll only have to be able to prompt the Rules class to settle things.


require "pry"
require_relative "2015-01-29-rps-player-class.rb"

# Class: Game
#
# Contains the methods for actually playing PSR  
#
# Attributes:
# @app_name1 - String: represents the player's name
# @app_name2 - String: represents the other player's name 
# @player1   - Object: instantiation of class Player
# @player2   - Object: another instantiation of class Player
#
# Public Methods:
# #get_match_num
# #best_of_loop
# #collect_moves
# #add_moves
# #result
# #print_rules
# #print_move_array


class Game < Player
  
  attr_accessor :app_name1, :app_name2, :player1, :player2
  
  # Private: #initialize
  # Establishes primary instance variables when you instantiate the class.
  #
  # Parameters:
  # @app_name1 - name of the new player
  # @app_name2 - name of the new player
  # @player1   - Object: instantiation of class Player
  # @player2   - Object: another instantiation of class Player
  #
  # Returns:
  # ?
  #
  # State Changes:
  # Sets @name, @victories and @moves
  
  def initialize(app_name1, app_name2, player1, player2)
    @app_name1 = app_name1
    @app_name2 = app_name2
    @player1 = player1
    @player2 = player2 
  end
  
  # Public: #play_game
  # Basically a method of methods - runs the Game class methods in the proper order
  #
  # Parameters:
  # this_game - The instantiation of Game class being used in the driver (app.rb)
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def play_game(this_game)
    @this_game = this_game
    @this_game.print_rules
    @this_game.get_match_num
    @this_game.best_of_loop
    @this_game.deliver_results
    @this_game.print_move_array
  end
    
  # Public: #get_match_num
  # Gets integer from user regarding how many games they want to play.
  #
  # Parameters:
  # None
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def get_match_num
    print "All right, what are we thinking? Best out of 3? Best out of 6? Give me a number:"
    @match_num = gets.chomp.to_i

    until @match_num > 0
      print "Has to be a number bigger than 0 (duh):"
      @match_num = gets.chomp.to_i
    end
  end
  
  # Public: #best_of_loop
  # Sets up loop to play game until number of rounds specified by players has been reached and a player has 
  # won at least half of the games. 
  #
  # Parameters:
  # game - Instatiation of the Game class
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def best_of_loop
    winner = ((@match_num / 2) + 1).ceil
    until @player1.add_win == winner || @player2.add_win == winner
      @this_game.collect_moves
      @this_game.add_moves
      @this_game.result
    end
  end
  
  # Public: #collect_moves
  # Gets moves from the players
  #
  # Parameters:
  # None
  #
  # Returns:
  # value of move2?
  #
  # State Changes:
  # Creates instance variables @move1 and @move2 and assigns values to them
    
  def collect_moves
    puts "#{app_name1}, what's your move?"
    @move1 = gets.chomp.downcase
    puts "#{app_name2}, what's your move?"
    @move2 = gets.chomp.downcase
  end  
  
  # Public: #add_moves
  # Adds players' moves to their @moves arrays
  #
  # Parameters:
  # None
  #
  # Returns:
  # @moves array for @player2?
  #
  # State Changes:
  # Updates @moves array
  
  def add_moves
    @player1.move_total(@move1)
    @player2.move_total(@move2)
  end
    
  # Public: #result
  # Figure out who won each round and adds result to @score_sheet array
  #
  # Parameters:
  # None
  #
  # Returns:
  # Depends on which if statement evaluates to true. ?
  #
  # State Changes:
  # Changes @score_sheet array
  
  def result  
      if ((@move2 != "rock" && @move2 != "scissors") && @move2 != "paper") && ((@move1 != "rock" && @move1 != "scissors") && @move1 != "paper")
      puts "RESULT: You're both hopeless. EVERYONE LOSES. (Except for me.)" 

    elsif (@move1 != "rock" && @move1 != "scissors") && @move1 != "paper"
      puts "RESULT: Dude, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{@move1}\" nonsense. #{@app_name2} wins because duh."
      @player2.add_win(1)

    elsif (@move2 != "rock" && @move2 != "scissors") && @move2 != "paper"
      puts "RESULT: \"#{@move2}\"???? P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. That's it, #{@app_name2}. #{@app_name1} wins by default of your incompetence."
      @player1.add_win(1)
    
    elsif @move1 == @move2
      puts "RESULT: How unoriginal. It's a tie."
      @player1.add_tie(1)
      @player2.add_tie(1)

    elsif @move1 == "rock" && @move2 == "paper"
      puts "RESULT: #{@app_name2}, you DESTROYED #{@app_name1} with the fierce fury of your .... paper."
      @player2.add_win(1)

    elsif @move1 == "rock" && @move2 == "scissors"
      puts "RESULT: #{@app_name2}, they should call you Battlestar Pegasus for the way you've been obliterated. #{@app_name1} wins!"
      @player1.add_win(1)

    elsif @move1 == "paper" && @move2 == "rock"
      puts "RESULT: #{@app_name1}, you are a CHAMP. A champ, I say. Would you like to be the guest of honor at my next dinner party? (#{@app_name2}, you're not invited.)"
      @player1.add_win(1)

    elsif @move1 == "paper" && @move2 == "scissors"
      puts "RESULT: You know that scene from 'Titanic' where the dude screams 'I'm the king of the world!' at the bow of the ship? #{@app_name2}, you're that guy. #{@app_name1}? You drowned, alone and forgotten."
      @player2.add_win(1)
      
    elsif @move1 == "scissors" && @move2 == "paper"
      puts "RESULT: Really? Who actually picks 'paper'? No wonder that #{@app_name1} cut through that stationary like Leslie Knope through Pawnee's bureaucratic red tape."
      @player1.add_win(1)

    elsif @move1 == "scissors" && @move2 == "rock"
      puts "RESULT: #{@app_name2.upcase} SMASH. #{@app_name1.upcase} LOSE."
      @player2.add_win(1)
      
    else
    end
  end
  
  # Public: #print_rules
  # Outputs the rules to the console if a player requests them.
  #
  # Parameters:
  # None
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def print_rules
    puts "Do you need a refresher on the rules? Y or N."
    answer = gets.chomp.downcase

    if answer == "y"
      puts "RULES:"
      puts "So the premise is simple (if deeply flawed): Each player chooses one of three items (rock, paper or scissors)."
      puts "- Rock beats scissors (makes sense)."
      puts "- Scissors cut paper (sure, I can accept that)."
      puts "- Paper covers rock (in the words of Flula, this just doesn't make sense:"
      puts "\"This help a rock. Rock does not now have sunburn, rock can have bad hair day, and paper has helped out.\")"
      puts "So each player selects their item, and then we see who wins!"
      puts ""
    end
  end
  
  # Public: #deliver_results
  # Outputs the results to the console
  #
  # Parameters:
  # None
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def deliver_results
    puts ""
    puts "Game over! Final scores:"
    puts "#{@app_name1}:\nWins: #{@player1.add_win}, Ties: #{@player1.add_tie}."
    puts ""
    puts "#{@app_name2}:\nWins: #{@player2.add_win}, Ties: #{@player2.add_tie}."
  end
  
  # Public: #print_move_array
  # Outputs the moves each player made to the console if the player wants.
  #
  # Parameters:
  # None
  #
  # Returns:
  # ?
  #
  # State Changes:
  # None
  
  def print_move_array
    puts "Want to see which moves you made? Y or N."
    move_answer = gets.chomp.downcase

    if move_answer == "y"
      puts "#{@app_name1}, you played #{@player1.show_move_total}."
      puts "#{@app_name2}, you played #{@player2.show_move_total}."
      puts ""
      puts "Thanks for playing!"
    else
      puts "No problem. Thanks for playing!"
    end
  end
  
end
  



  
binding.pry
  
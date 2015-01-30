require "pry"

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
  
  attr_accessor :app_name1, :app_name2, :player1, :player2
  
  def initialize(app_name1, app_name2, player1, player2)
    @app_name1 = app_name1
    @app_name2 = app_name2
    @player1 = player1 #instantiation of Player class?
    @player2 = player2 #instantiation of Player class?
  end
    
    
    
  def collect_moves
    puts "#{app_name1}, what's your move?"
    @move1 = gets.chomp.downcase
    puts "#{app_name2}, what's your move?"
    @move2 = gets.chomp.downcase
  end  
    
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
  
  def result    
    if ((@move2 != "rock" && @move2 != "scissors") && @move2 != "paper") && ((@move1 != "rock" && @move1 != "scissors") && @move1 != "paper")
      print "You're both hopeless. EVERYONE LOSES. (Except for me.)" 
      @player1.move_total(@move1)
      @player2.move_total(@move2)

    elsif (@move1 != "rock" && @move1 != "scissors") && @move1 != "paper"
      print "Dude, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{@move1}\" nonsense. #{@app_name2} wins because duh."
      @player2.victory_total(1)

    elsif (@move2 != "rock" && @move2 != "scissors") && @move2 != "paper"
      print "\"#{@move2}\"???? P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. That's it, #{@app_name2}. #{@app_name1} wins by default of your incompetence."
      @player1.victory_total(1)
    
    elsif @move1 == @move2
      print "How unoriginal. It's a tie."

    elsif @move1 == "rock" && @move2 == "paper"
      print "#{@app_name2}, you DESTROYED #{@app_name1} with the fierce fury of your .... paper."
      @player2.victory_total(1)

    elsif @move1 == "rock" && @move2 == "scissors"
      print "#{@app_name2}, they should call you Battlestar Pegasus for the way you've been obliterated. #{@app_name1} wins!"
      @player1.victory_total(1)

    elsif @move1 == "paper" && @move2 == "rock"
      print "#{@app_name1}, you are a CHAMP. A champ, I say. Would you like to be the guest of honor at my next dinner party? (#{@app_name2}, you're not invited.)"
      @player1.victory_total(1)

    elsif @move1 == "paper" && @move2 == "scissors"
      print "You know that scene from 'Titanic' where the dude screams 'I'm the king of the world!' at the bow of the ship? #{@app_name2}, you're that guy. #{@app_name1}? You drowned, alone and forgotten."
      @player2.victory_total(1)
      
    elsif @move1 == "scissors" && @move2 == "paper"
      print "Really? Who actually picks 'paper'? No wonder that #{@app_name1} cut through that stationary like Leslie Knope through Pawnee's bureaucratic red tape."
      @player1.victory_total(1)

    elsif @move1 == "scissors" && @move2 == "rock"
      print "#{@app_name2.upcase} SMASH. #{@app_name1.upcase} LOSE."
      @player2.victory_total(1)
      
    else
    end
  end
  
  def print_rules
    puts "So the premise is simple (if deeply flawed): Each player chooses one of three items (rock, paper or scissors)."
    puts "- Rock beats scissors (makes sense)."
    puts "- Scissors cut paper (sure, I can accept that)."
    puts "- Paper covers rock (in the words of Flula, this just doens't make sense:"
    puts "\"This help a rock. Rock does not now have sunburn, rock can have bad hair day, and paper has helped out.\")"
    puts "So each player selects their item, and then we see who wins!"
  end

  
end
  



  
binding.pry
  
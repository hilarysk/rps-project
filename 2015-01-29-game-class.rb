require "pry"


# # Level 0 is where we get things working at their most basic level.
#
# 2. Player classes + overall driver method. Driver method should create players, tell the players to prompt for moves, and determine the winner. Players should keep track of their names and moves, and should still only accept valid moves. From the user’s perspective, the game should appear to work exactly the same.
# 3. Players should be able to play a best-of-n match, which will require you to keep track of each player’s score.
# 4. Go back and provide method documentation for all of your classes and custom-written methods. If you wrote the class (or method), you gotta document it.





# Right now, have just one hash (@archive) where the key is an instantiation of the Player class (name and score) and the value is an array containing strings of all the moves. Wondering if might need to break it out like did for DiningClub where there's a hash-array for the player name and moves and a hash for the player name and score ... not sure yet, but something to keep in mind.

class Game
  
  
  def initialize 
    @archive = {}
  end
  
  # Public: #add_players
  # Creates two new players and adds them as keys to the @archive hash; adds array as value. If you only 
  # want to add one new member instead of two, name2 defaults to nil if no argument is provided when calling 
  # the method.
  #
  # Parameters:
  # name1 - Player one's name
  # name2 - Player two's name (or nil)
  #
  # Returns:
  # Two (or one) new instantiations of class Player
  #
  # State Changes:
  # Defines instance variables @player1 /and @player2, and adds key-value pair/s to hash @archive
  
  def add_players(name_1_for_adding, name_2_for_adding=nil)  #pretty sure I can do this 
    @name1 = name_1_for_adding # make so players can enter their own names
    @name2 = name_2_for_adding
    
    @player1 = Player.new(name1)
    @archive[@player1] = []
    
    @player2 = Player.new(name2)
    @archive[@player2] = []
    
    
    #-----------------OR------------------------
    
    puts "Player 1, what's your name?"
    @name1 = gets.chomp
    puts "Player 2, what's your name?"
    @name2 = gets.chomp
    
    @player1 = Player.new(@name1)
    @archive[@player1] = []
    
    @player2 = Player.new(@name2)
    @archive[@player2] = []
  end
  
  # Public: #make_and_record_moves
  # Updates the array that occupies the value spot in the @archives hash for the specified player and
  # collects a move from each player for one game of PSR.
  #
  # Parameters:
  # name_1_for_move - name of one of the players
  # name_2_for_move - name of the other player
  #
  # Returns:
  # @archive
  #
  # State Changes:
  # Changes @name1, @name2, sets @move1 and @move2 and updates @archive
  
  def make_and_record_moves(name_1_for_move, name_2_for_move) 
    if name_1_for_move == @name1 && name_2_for_move == @name2
      @name1 = name_1_for_move 
      @name2 = name_2_for_move
    elsif name_1_for_move == @name2 && name_2_for_move == @name1
      @name1 = name_2_for_move 
      @name2 = name_1_for_move
    end
    
    puts "#{@name1}, what's your move?"
    @move1 = gets.chomp.downcase
    
    puts "#{@name2}, what's your move?"
    @move2 = gets.chomp.downcase
    
    @archive[@player1] = @move1.push
    @archive[@player2] = @move2.push
    
    return @archive
  end
  
  # Public: #show_moves_for_specific_player
  # Iterates through @archive and collects moves for specified player. If player isn't part of @archive, it 
  # outputs an error message.
  #
  # Parameters:
  # player_name - name of player for whom you wish to see moves
  #
  # Returns:
  # value (moves) for specified key (player)?
  #
  # State Changes:
  # None
    
  def show_moves_for_specific_player(player_name)
    @archive.each do |namescore, moves|
    if namescore.include?(player_name)
      returns moves #@archive[namescore]?
    else 
      puts "Error: #{player_name} not found in archive."
    end
  end
  
  # Public: #show_moves_for_all_players
  # Iterates through @archive and returns moves for all players. 
  #
  # Parameters:
  # None
  #
  # Returns:
  # Moves for all players
  #
  # State Changes:
  # None
  
  def show_moves_for_all_players
    @archive.each do |namescore, moves|
    returns moves #AND NEED TO RETURN JUST NAME FROM OBJECT so you know whose moves are whose
    end
  end
  
  # Public: #show_player_victory_tally
  # Iterates through @archive and finds number of wins for specified player. If player isn't part of 
  # @archive, it outputs an error message.
  #
  # Parameters:
  # player_name - name of player for whom you wish to see victory total
  #
  # Returns:
  # @archive key for specified player
  #
  # State Changes:
  # None
  
  def show_player_victory_tally(player_name)
    @archive.each do |namescore, moves|
    if namescore.include?(player_name)
      returns namescore
    else 
      puts "Error: #{player_name} not found in archive."
    end
  end
  
  # Public: #show_all_players_victory_tallies
  # Iterates through @archive and returns list of players' names and win totals
  #
  # Parameters:
  # None
  #
  # Returns:
  # List of players' names and win totals
  #
  # State Changes:
  # None
  
  def show_all_players_victory_tallies
    @archive.each do |namescore, moves|
    returns namescore
    end
  end
  
  
  
  def judge_moves
    
    
    
    
    
    #add_victory(win_num) - method to add win to player's total'
  
  end
  
end
  

  if move_1 == move_2
    print "It's a tie!"

  elsif move_1 == "rock" && move_2 == "paper"
    print "Player 2 wins!"

  elsif move_1 == "rock" && move_2 == "scissors"
    print "Player 1 wins!"

  elsif move_1 == "paper" && move_2 == "rock"
    print "Player 1 wins!"

  elsif move_1 == "paper" && move_2 == "scissors"
    print "Player 2 wins!"

  elsif move_1 == "scissors" && move_2 == "paper"
    print "Player 1 wins!"

  elsif move_1 == "scissors" && move_2 == "rock"
    print "Player 2 wins!"

  elsif  ((move_2 != "rock" && move_2 != "scissors") && move_2 != "paper") && ((move_1 != "rock" && move_1 != "scissors") && move_1 != "paper")
    print "You're both hopeless. EVERYONE LOSES. (Except for me.)"

  elsif (move_1 != "rock" && move_1 != "scissors") && move_1 != "paper"
    print "Um, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{move_1}\" nonsense. Player 2 wins by default."

  elsif (move_2 != "rock" && move_2 != "scissors") && move_2 != "paper"
    print "Um, your only options are P-A-P-E-R, S-C-I-S-S-O-R-S or R-O-C-K. None of this \"#{move_2}\" nonsense. Player 1 wins by default."

  else
    print "Something went wrong ... we're sending the space monkeys into the computer to try and fix it."
  end

  
binding.pry
  
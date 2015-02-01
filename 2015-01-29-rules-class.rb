# 3. The Game class is still doing too much (running the game, comparing player moves, etc.). Let’s create a Rules class to which we can delegate the job of comparing moves to determine the round winner, and to which we can delegate the job of holding the list of valid moves. This means that neither the Game class nor the Player class will have to know anything about the rules of the game; they'll only have to be able to prompt the Rules class to settle things.

require "pry"
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"
require_relative "2015-01-29-rules-class.rb"

class PSR_rules
  def initialize
    @rules_matrix = {"paper"=>[{"paper"=>"RESULT: How unoriginal. It's a tie."}, 
                                   {"rock"=>"RESULT: #{@app_name1.capitalize}, you are a CHAMP. A champ, I say. Would you like to be the guest of honor at my next dinner party? (#{@app_name2.capitalize}, you're not invited."}, 
                                   {"scissors"=>"RESULT: You know that scene from 'Titanic' where the dude screams, 'I'm the king of the world!' at the bow of the ship? #{@app_name2.capitalize}, you're that guy. #{@app_name1}? You drowned, alone and forgotten."}], 
                                   
                         "rock"=>[{"rock"=>"RESULT: How unoriginal. It's a tie."}, 
                                  {"scissors"=>"RESULT: #{@app_name2.capitalize}, they should call you Battlestar Pegasus for the way you've been obliterated. #{@app_name1.capitalize} wins!"}, 
                                  {"paper"=>"RESULT: #{@app_name2.capitalize}, you DESTROYED #{@app_name1} with the fierce fury of your dried wood pulp."}],
                                  
                                  
                         "scissors"=>[{"scissors"=>"RESULT: How unoriginal. It's a tie."}, 
                                      {"paper"=>"RESULT: Really? Who actually picks 'paper'? No wonder that #{@app_name1} cut through that stationary like Leslie Knope through Pawnee's bureaucratic red tape."}, 
                                      {"rock"=>"RESULT: #{@app_name2.upcase} SMASH. #{@app_name1.upcase} LOSE."}]}
  end
  
  #how to add scores, though?  @player2.add_win(1) 
  
  
     

  # # Public: #result
  # # Figure out who won each round
  # #
  # # Parameters:
  # # move1     - The first player's move
  # # move2     - The second player's move
  # # app_name1 - The first player's name
  # # app_name2 - The second player's name
  # #
  # # Returns:
  # # ?
  # #
  # # State Changes:
  # # Changes @score_sheet array
  
  def judge_game(move1, move2, app_name1, app_name2)
    @move1 = move1
    @move2 = move2
    @app_name1 = app_name1
    @app_name2 = app_name2
    
    @rules_matrix.each do |first_move, second_move_array|
      if first_move.include?("@move1")
        second_move_array.each do |second_move_combos|
          if second_move_combo.include?("@move2")
            second_move_combos.each do |move, result|
              puts result
            end
          else "RESULT: \"#{@move2}\"???? P-a-p-e-r, s-c-i-s-s-o-r-s or r-o-c-k. That's it, #{@app_name2}. #{@app_name1.capitalize} wins by default of your incompetence."           
          end
        end
      else
        second_move_array.each do |second_move_combos|
          if second_move_combo.include?("@move2")
            second_move_combos.each do |move, result|
              puts "RESULT: Dude, your only options are p-a-p-e-r, s-c-i-s-s-o-r-s or r-o-c-k. None of this \"#{@move1}\" nonsense. #{@app_name2.capitalize} wins because duh."
            end
          else 
            puts "RESULT: You're both hopeless. EVERYONE LOSES. (Except for me.)"
          end
        end
      end
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
  
end

binding.pry
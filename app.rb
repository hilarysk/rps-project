require "pry"
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"


# Establish players

puts "Player 1, what's your name?"
app_name1 = gets.chomp.to_sym

puts "Player 2, what's your name?"
app_name2 = gets.chomp.to_sym

@player1 = Player.new(app_name1)
@player2 = Player.new(app_name2)

game = Game.new(app_name1, app_name2, @player1, @player2)

# Establish rules

puts "Do you need a refresher on the rules? Y or N."
answer = gets.chomp.downcase

if answer == "y"
  puts ""
  game.print_rules
end

puts ""

# Establish best-of number

print "All right, what are we thinking? Best out of 3? Best out of 6? Give me a number:"
match_num = gets.chomp.to_i

until match_num > 0
  print "Has to be a number bigger than 0 (duh):"
  match_num = gets.chomp.to_i
end

# Sets loop 

game.best_of_loop(match_num, game)

# Deliver results

puts ""
puts "That was the last match. Final scores:"
puts "#{app_name1}, your score is:\nWins: #{@player1.add_win}, Ties: #{@player1.add_tie}."
puts ""
puts "#{app_name2}, your score is:\nWins: #{@player2.add_win}, Ties: #{@player2.add_tie}."

puts "Want to see which moves you made? Y or N."
move_answer = gets.chomp.downcase

if move_answer == "y"
  puts "#{app_name1}, you played #{@player1.show_move_total}."
  puts "#{app_name2}, you played #{@player2.show_move_total}."
  puts ""
  puts "Thanks for playing!"
else
  puts "No problem. Thanks for playing!"
end

binding.pry
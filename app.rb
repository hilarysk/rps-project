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

puts "Do you need a refresher on the rules?"
answer = gets.chomp.downcase

if (answer == "yes" || answer == "y") || (answer == "yeah" || answer == "sure") || (answer == "duh" || answer == "maybe") || answer == "why not"
  game.print_rules
end



puts "All right, what are we thinking? Best out of 3? Best out of 5? Give me a number."
match_num = gets.chomp.to_i

#sets loop for match_num number of matches - need to make a method? but how?

if match_num %2 != 0 && match_num > 0
    match_num.times do
      game.collect_moves
      game.add_moves
      game.result
    end
else
    print "Hmm, I don't think you entered a real number - or maybe you entered an even number (which doesn't really make sense if you're looking for a clear winner.) Try again?"
    match_num = gets.chomp.to_i
    if match_num %2 != 0 && match_num > 0
        match_num.times do
          game.collect_moves
          game.add_moves
          game.result
        end
    end
end

puts ""
puts "That was the last match. Final scores:"

puts "#{app_name1}, your score is #{@player1.victory_total}."
puts "#{app_name2}, your score is #{@player2.victory_total}."

puts "Want to see which moves you made? Y or N."
move_answer = gets.chomp.downcase

if move_answer == "y"
  puts "#{app_name1}, you played #{@player1.show_move_total}."
  puts "#{app_name2}, you played #{@player2.show_move_total}."
  puts "Thanks for playing!"
else
  puts "No problem. Thanks for playing!"
end

binding.pry
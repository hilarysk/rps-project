require 'minitest/autorun'
require_relative "2015-01-29-rps-player-class.rb"

class PlayerTest < Minitest::Test
  
  #tests go here
  #Each test method should start with test_, ala:
  
  def test_that_string_enters_the_moves_array
    player = Player.new("simon")
    player.move_total("paper")
    assert_equal(["paper"], @moves)
  end
  
  
  
  
  # def test_
 #    player = Player.new(simon)
 #  end
 #
 #  def test_
 #    player = Player.new(simon)
 #  end

end

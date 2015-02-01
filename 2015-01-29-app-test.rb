require 'minitest/autorun'
require_relative "2015-01-29-rps-player-class.rb"
require_relative "2015-01-29-game-class.rb"
require_relative "app.rb"
require "pry"

class RPSTest < Minitest::Test
  
  #tests go here
  #Each test method should start with test_, ala:
  
  def test_simple_input_with_expected_integer_output
    cs = Checksplitter.new(5, 20, 5)
    assert_equal(1.2, cs.cost_per_person)
  end
  
  
end

binding.pry 
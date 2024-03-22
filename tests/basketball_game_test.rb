require 'minitest/autorun'
require_relative '../basketball_game' # Adjust the path as necessary

class BasketballGameTest < Minitest::Test
  def setup
    puts "Setting up a new Basketball Game test instance."
    @game = BasketballGame.new
  end

  def test_start_game
    puts "Testing start_game method."
    @game.start_game('Team A', 'Team B')
    assert_equal('Team A', @game.team1, "team1 was not initialized correctly")
    assert_equal('Team B', @game.team2, "team2 was not initialized correctly")
    assert_equal(0, @game.score1, "score1 was not initialized to 0")
    assert_equal(0, @game.score2, "score2 was not initialized to 0")
    assert(@game.game_active, "game_active was not set to true")
  end

  def test_update_score
    puts "Testing update_score method."
    @game.start_game('Team A', 'Team B')
    @game.update_score(1, 3) # Team 1 scores 3 points
    @game.update_score(2, 2) # Team 2 scores 2 points
    assert_equal(3, @game.score1, "score1 was not updated correctly")
    assert_equal(2, @game.score2, "score2 was not updated correctly")
  end
end

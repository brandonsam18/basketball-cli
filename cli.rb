require_relative 'basketball_game'

class CLI
  def initialize
    @game = BasketballGame.new
  end

  def start
    loop do
      puts "1. Start New Game\n2. Update Score\n3. Display Score\n4. End Game\n5. Exit"
      choice = gets.chomp

      case choice
      when "1"
        start_new_game
      when "2"
        update_score if @game.game_active
      when "3"
        puts @game.display_score if @game.game_active
      when "4"
        end_game if @game.game_active
      when "5"
        puts "Exiting..."
        break
      else
        puts "Invalid choice. Please select again."
      end
    end
  end

  private

  def start_new_game
    puts "Enter Team 1 name:"
    team1 = gets.chomp
    puts "Enter Team 2 name:"
    team2 = gets.chomp
    @game.start_game(team1, team2)
    puts "Game started: #{team1} vs #{team2}"
  end

  def update_score
    puts "Which team scored? (1 or 2)"
    team = gets.chomp.to_i
    puts "How many points? (1, 2, or 3)"
    points = gets.chomp.to_i
    @game.update_score(team, points)
  end

  def end_game
    final_score, winner = @game.end_game
    puts "Game ended. Final Score: #{final_score}. Winner: #{winner}"
  end
end

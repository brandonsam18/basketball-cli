class BasketballGame
  attr_accessor :team1, :team2, :score1, :score2, :game_active

  def initialize
    @team1 = ""
    @team2 = ""
    @score1 = 0
    @score2 = 0
    @game_active = false
  end

  def start_game(team1, team2)
    @team1 = team1
    @team2 = team2
    @score1 = 0
    @score2 = 0
    @game_active = true
  end

  def update_score(team, points)
    if team == 1
      @score1 += points
    elsif team == 2
      @score2 += points
    else
      puts "Invalid team selection."
    end
  end

  def display_score
    "#{@team1}: #{@score1} - #{@team2}: #{@score2}"
  end

  def end_game
    @game_active = false
    final_score = "#{@team1}: #{@score1} - #{@team2}: #{@score2}"
    winner = if @score1 > @score2
               @team1
             elsif @score2 > @score1
               @team2
             else
               "It's a tie!"
             end
    [final_score, winner]
  end
end

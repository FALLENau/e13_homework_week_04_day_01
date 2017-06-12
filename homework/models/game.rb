class Game

  attr_reader :game

def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
end

  def play()
    return "Tie" if @player1 == @player2
    if @player1 == 'rock' && @player2 == 'scissors'
      return 'Rock wins'
    elsif @player1 == 'scissors' && @player2 == 'paper'
      return 'scissors wins'
    else
      return 'Paper wins'
    end
  end
end

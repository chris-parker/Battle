class Game

  attr_reader :players, :player_swap

  def initialize(player1, player2)
    @players = [player1, player2]
    @player_swap = @players.dup
  end

  def attack
    @player_swap.last.reduce_hp
    @player_swap.reverse!
  end

end

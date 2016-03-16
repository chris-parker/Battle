class Game

  attr_reader :players, :flipper

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @flipper = @players.dup
  end

  def attack
    @flipper.last.receive_damage
    @flipper.reverse!
  end
end

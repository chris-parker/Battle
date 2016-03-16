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

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  @game = Game.instance

end

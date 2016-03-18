class Game

  def self.attack
    @players.last.reduce_hp
    @players.reverse!
  end

  def self.start(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [player_1, player_2]
  end

  def self.player_1
    @player_1
  end

  def self.player_2
    @player_2
  end

  def self.players
    @players
  end

end

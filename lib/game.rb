class Game

  def self.attack
    @players.last.reduce_hp
    @players.reverse!
    self.attack if self.single_player?
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

  def self.random
    rand(1..2)
  end

  def self.game_over?
    @player_1.dead? || @player_2.dead?
  end

  def self.single_player?
    @players.first.name == "Computer"
  end

end

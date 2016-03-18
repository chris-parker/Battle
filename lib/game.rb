class Game

  def self.attack(strength)
    @players.last.attack(strength)
    @players.reverse!
    self.computer_attack
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

  def self.computer_attack
    strength = ["light", "heavy"].sample
    self.attack(strength) if @players.first.name == "Computer"
  end

end

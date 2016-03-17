class Player

  attr_reader :hp

  def initialize(name)
    @name = name
    @hp = 100
  end

  def name
    @name
  end

  def hp_check
    @hp
  end

  def reduce_hp
    @hp -= 20
  end
end

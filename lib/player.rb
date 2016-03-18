class Player

  attr_reader :hp

  def initialize(name="Computer")
    assign name
    @hp = 100
  end

  def name
    @name
  end

  def hp_check
    @hp
  end

  def attack(strength)
    damage = Kernel.rand(1..20) if strength == "heavy"
    damage = Kernel.rand(3..10) if strength == "light"
    damage >= @hp ? @hp = 0 : @hp -= damage
  end

  def dead?
    @hp <= 0
  end

  private

  def assign(name)
    name == "" ? @name = "Computer" : @name = name
  end

end

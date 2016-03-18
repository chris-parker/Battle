class Player

  attr_reader :hp

  def initialize(name="Computer")
    @paralyzed = false
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
    @paralyzed = false
    damage = Kernel.rand(1..20) if strength == "heavy"
    damage = Kernel.rand(3..10) if strength == "light"
    if strength == "paralyze"
      damage = Kernel.rand(0..7)
      paralyze
    end
    damage >= @hp ? @hp = 0 : @hp -= damage
  end

  def dead?
    @hp <= 0
  end

  def paralyzed?
    @paralyzed
  end

  def paralyze
    @paralyzed = Kernel.rand(1..3) % 2 == 0
  end

  private

  def assign(name)
    name == "" ? @name = "Computer" : @name = name
  end

end

class Unit
  attr_accessor :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
      dead? ? enemy.damage(@attack_power) : nil
      self.dead? if @health_points == 0
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

  def dead?
    if self.health_points >= 1
      false
    else
      true
    end
  end
end

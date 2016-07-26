class Unit
  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
    @num = 1
  end

  def attack!(enemy)
    dead? ? nil : enemy.damage(@attack_power)
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

  def dead?
    !(self.health_points >= 1)
  end
end

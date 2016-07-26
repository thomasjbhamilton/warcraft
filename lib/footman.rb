# http://classic.battle.net/war3/human/units/footman.shtml



class Footman < Unit
  attr_accessor :health_points, :attack_power

  def initialize(health_points=60, attack_power=10)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    enemy.damage(@attack_power)
  end

  def damage(attack_power)
    @health_points -= attack_power
  end
end

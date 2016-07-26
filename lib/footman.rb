# http://classic.battle.net/war3/human/units/footman.shtml



class Footman < Unit
  attr_accessor :health_points, :attack_power

  def initialize(health_points=60, attack_power=10)
    @health_points = health_points
    @attack_power = attack_power
    @num = 0.5
  end

  def attack!(enemy)
    if dead?
      nil
    else
      if enemy.is_a? Barracks
        attack_power = (@attack_power / 2).ceil
        enemy.damage(attack_power)
      else
        enemy.damage(@attack_power)
      end
    end
  end
end

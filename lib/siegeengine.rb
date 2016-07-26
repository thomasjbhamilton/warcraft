class SiegeEngine < Unit
  def initialize(health_points=400, attack_power=40)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    if dead?
      nil
    else
      if enemy.is_a? Barracks
        attack_power = (@attack_power * 2).ceil
        enemy.damage(attack_power)
      elsif enemy.is_a? Footman || Peasant
        nil
      else
        enemy.damage(@attack_power)
      end
    end
  end
end

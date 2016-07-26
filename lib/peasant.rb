class Peasant
  attr_reader :health_points, :attack_power

  def initialize(health_points=35)
    @health_points = health_points
    @attack_power = 0
  end
end

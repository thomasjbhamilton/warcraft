class Barracks
  attr_accessor :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def can_train_footman?
    self.gold > 135 && self.food >= 2
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      footman = Footman.new
    else
      nil
    end
  end

  def can_train_peasant?
   self.gold > 90  && self.food >= 5
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      peasant = Peasant.new
    else
      nil
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      peasant = Peasant.new
    else
      nil
    end
  end


  def can_build_seigeengine?
    self.gold > 200  && self.food >= 3 && self.lumber >= 60
  end

  def build_siegeengine
    if can_build_seigeengine?
      @gold -= 200
      @food -= 5
      @lumber -= 60
      siege_engine = SiegeEngine.new
    else
      nil
    end
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

end

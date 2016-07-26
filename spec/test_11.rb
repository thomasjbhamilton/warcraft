require_relative 'spec_helper'

describe Footman do

  before :each do
    @footman = Footman.new
  end

  describe "#attack!" do
    it "loses half its attack power when attacking a Barraks" do
      enemy = Barracks.new
      expect(enemy).to receive(:damage).with(5)
      @footman.attack!(enemy)
    end
  end
end

describe Barracks do
  describe "#damage" do
    it "should reduce the Barracks health_points by the attack_power specified" do
      @barracks = Barracks.new
      @barracks.damage(5)
      expect(@barracks.health_points).to eq(495) # starts at 500
    end
  end
end

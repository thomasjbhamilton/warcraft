require_relative 'spec_helper'

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  describe "#attack" do

    it "should do deal 40 (AP) damage to the enemy unit" do
      enemy = SiegeEngine.new
      expect(enemy).to receive(:damage).with(40)
      @siege_engine.attack!(enemy)
    end

    it "should do deal 8 or 2x (AP) damage to the enemy Barracks" do
      enemy = Barracks.new
      expect(enemy).to receive(:damage).with(80)
      @siege_engine.attack!(enemy)
    end

    it "can't attack when enemy is a Footman or Peasant" do
      enemy = Footman.new
      expect(@siege_engine.attack!(enemy)).to be_falsey
    end

    it "can't attack when dead" do
      enemy = Footman.new
      expect(@siege_engine).to receive(:dead?).and_return(true)
      expect(@siege_engine.attack!(enemy)).to be_nil
    end
  end
end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#can_build_seigeengine?" do
    it "returns true if there are enough resources to train a footman" do
      expect(@barracks.can_build_seigeengine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      expect(@barracks).to receive(:food).and_return(1)
      expect(@barracks.can_build_seigeengine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(134)
      expect(@barracks.can_build_seigeengine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      expect(@barracks).to receive(:lumber).and_return(12)
      expect(@barracks.can_build_seigeengine?).to be_falsey
    end
  end

  describe "#build_siegeengine" do
    it "does not build a siege engine if there aren't enough resources" do
      expect(@barracks).to receive(:can_build_seigeengine?).and_return(false)
      expect(@barracks.build_siegeengine).to be_nil
    end

    it "trains a footman if there are enough resources" do
      expect(@barracks).to receive(:can_build_seigeengine?).and_return(true)
      expect(@barracks.build_siegeengine).to be_a(SiegeEngine)
    end
  end

end

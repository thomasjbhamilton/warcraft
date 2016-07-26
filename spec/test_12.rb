
require_relative 'spec_helper'
describe Unit do

  before :each do
    @unit = Unit.new(60,5)
  end

  describe "#dead?" do

    it "units can die" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be_truthy
    end

    it "unit should be alive by default" do
      expect(@unit.dead?).to be_falsey
    end

    it "can't attack when dead" do
      enemy = Footman.new
      expect(@unit).to receive(:dead?).and_return(true)
      expect(@unit.attack!(enemy)).to be_nil
    end
  end
end

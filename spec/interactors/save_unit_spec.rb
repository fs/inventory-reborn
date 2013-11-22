require 'spec_helper'

describe SaveUnit do
  let(:user) { build :user }
  let(:unit) { build :unit }
  let(:location) { build :location }
  let(:unit_params) { attributes_for :unit }

  before do
    unit.stub(:save) { true }
    Location.stub(:find) { location }
    User.stub(:find) { user }
    unit_params.stub(:except) { unit_params }
    unit_params.stub(:permit) { unit_params }
  end

  describe '#perform' do
    it 'receive assing_attributes' do
      unit.should_receive(:assign_attributes) { unit }
      SaveUnit.perform(unit: unit, params: unit_params)
    end

    it 'receive save' do
      unit.should_receive(:save) { true }
      SaveUnit.perform(unit: unit, params: unit_params)
    end

    context 'assign user and location to unit' do
      before do
        SaveUnit.perform(unit: unit, params: unit_params)
      end

      it 'assign user to unit' do
        unit.user.should eq user
      end

      it 'assign location to unit' do
        unit.location.should eq location
      end
    end
  end
end

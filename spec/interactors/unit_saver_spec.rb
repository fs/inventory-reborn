require 'spec_helper'

describe UnitSaver do
  let(:user) { build :user }
  let(:unit) { build :unit }
  let(:room) { build :room }
  let(:unit_params) { attributes_for :unit }

  before do
    unit.stub(:save!) { true }
    Room.stub(:find) { room }
    User.stub(:find) { user }
    unit_params.stub(:except) { unit_params }
    unit_params.stub(:permit) { unit_params }
  end

  describe '#perform' do
    it 'receive assing_attributes' do
      unit.should_receive(:assign_attributes) { unit }
      UnitSaver.perform(unit: unit, unit_params: unit_params)
    end

    it 'receive save' do
      unit.should_receive(:save!) { true }
      UnitSaver.perform(unit: unit, unit_params: unit_params)
    end

    context 'assign user and room to unit' do
      before do
        UnitSaver.perform(unit: unit, unit_params: unit_params)
      end

      it 'assign user to unit' do
        unit.user.should eq user
      end

      it 'assign room to unit' do
        unit.room.should eq room
      end
    end
  end
end

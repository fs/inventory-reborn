require 'spec_helper'

describe UnitSaver do
  let(:user) { FactoryGirl.build :user }
  let(:unit) { FactoryGirl.build :unit }
  let(:room) { FactoryGirl.build :room }
  let(:unit_params) { FactoryGirl.attributes_for :unit }

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

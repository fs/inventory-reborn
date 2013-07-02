require 'spec_helper'

describe UnitSaver do
  let(:user) { FactoryGirl.build :user }
  let(:unit) { FactoryGirl.build :unit }
  let(:room) { FactoryGirl.build :room }
  let(:unit_saver) { UnitSaver.new(unit, user) }

  before do
    unit.stub(:save!) { true }
    unit_saver.stub(:unit_params) { Hash.new }
    unit_saver.stub(:room) { room }
    unit_saver.stub(:user) { user }
  end

  describe '#create!' do
    it 'receive assing_attributes' do
      unit.should_receive(:assign_attributes) { unit }
      unit_saver.create!
    end

    it 'receive save' do
      unit.should_receive(:save!) { true }
      unit_saver.create!
    end

    context 'assign user and room to unit' do
      before do
        unit_saver.create!
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

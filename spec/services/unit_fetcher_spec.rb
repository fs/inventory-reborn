require 'spec_helper'

describe UnitFetcher do
  let(:units) { FactoryGirl.build_list :unit, 2 }
  let(:user) { FactoryGirl.build :user }
  let(:room) { FactoryGirl.build :room }
  let(:unit_fetcher) { UnitFetcher.new }

  before do
    unit_fetcher.stub(:user) { user }
    unit_fetcher.stub(:room) { room }
    user.stub(:persisted?) { false }
    room.stub(:persisted?) { false }
  end

  describe '#units' do
    it 'should receive units for user' do
      user.should_receive(:units) { units }
      unit_fetcher.units
    end
    it 'should not receive units for room' do
      user.stub(:units) { units }
      room.should_not_receive(:units)
      unit_fetcher.units
    end

    it 'should receive units for room' do
      user.stub(:units) { [] }
      room.should_receive(:units) { units }
      unit_fetcher.units
    end

    it 'should not receive includes for User' do
      user.stub(:units) { [] }
      room.stub(:units) { units }
      User.should_not_receive(:includes)
      unit_fetcher.units
    end

    it 'should receive includes for User' do
      user.stub(:units) { [] }
      room.stub(:units) { [] }
      Unit.should_receive(:includes) { units }
      unit_fetcher.units
    end
  end

  describe '#ancestors' do
    it 'should return user and room' do
      unit_fetcher.ancestors.should  eq([:user, :room])
    end

    it 'should return user' do
      room.stub(:persisted?) { true }
      unit_fetcher.ancestors.should  eq([:user])
    end

    it 'should return room' do
      user.stub(:persisted?) { true }
      unit_fetcher.ancestors.should  eq([:room])
    end
  end
end

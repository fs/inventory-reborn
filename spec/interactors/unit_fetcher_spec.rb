require 'spec_helper'

describe UnitFetcher do
  let(:units) { build_list :unit, 2 }
  let(:user) { build :user }
  let(:location) { build :location }
  let(:unit_fetcher) { UnitFetcher.perform }

  before do
    UnitFetcher.any_instance.stub(:user) { user }
    UnitFetcher.any_instance.stub(:location) { location }
    user.stub(:persisted?) { false }
    location.stub(:persisted?) { false }
  end

  describe '#units' do
    it 'should receive units for user' do
      user.should_receive(:units) { units }
      UnitFetcher.perform
    end

    it 'should not receive units for location' do
      user.stub(:units) { units }

      location.should_not_receive(:units)
      UnitFetcher.perform
    end

    it 'should receive units for location' do
      user.stub(:units) { [] }

      location.should_receive(:units) { units }
      UnitFetcher.perform
    end

    it 'should not receive includes for User' do
      user.stub(:units) { [] }
      location.stub(:units) { units }

      User.should_not_receive(:includes)
      UnitFetcher.perform
    end

    it 'should receive includes for User' do
      user.stub(:units) { [] }
      location.stub(:units) { [] }

      Unit.should_receive(:includes) { units }
      UnitFetcher.perform
    end
  end

  describe '#ancestors' do
    it 'should return user and location' do
      unit_fetcher.ancestors.should  eq([:user, :location])
    end

    it 'should return user' do
      location.stub(:persisted?) { true }
      unit_fetcher.ancestors.should  eq([:user])
    end

    it 'should return location' do
      user.stub(:persisted?) { true }
      unit_fetcher.ancestors.should  eq([:location])
    end
  end
end

require 'spec_helper'

describe FetchUnits::GetUnits do
  let(:service) { described_class.perform params }
  let(:user) { stub_model User }
  let(:location) { stub_model Location }
  let(:units) { double }
  let(:user_id) { double }
  let(:location_id) { double }

  context 'when user_id defines' do
    let(:params) { { user_id: double } }

    before do
      User.stub(:find) { user }
      user.stub(:units) { units }
    end

    it 'assigns user to service' do
      expect(service.user).to eq user
    end

    it 'gets user\'s units' do
      expect(service.units).to eq user.units
    end
  end

  context 'when location_id defines' do
    let(:params) { { location_id: double } }

    before do
      Location.stub(:find) { location }
      location.stub(:units) { units }
    end

    it 'assigns location to service' do
      expect(service.location).to eq location
    end

    it 'gets location\'s units' do
      expect(service.units).to eq location.units
    end
  end

  context 'when user_id and location_id are blank' do
    let(:params) { {} }

    before do
      Unit.stub(:includes).with(:user, :location) { units }
    end

    it 'gets all units' do
      expect(service.units).to eq units
    end
  end
end

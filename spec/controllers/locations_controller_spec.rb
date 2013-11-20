require 'spec_helper'

describe LocationsController do
  let(:locations) { build_list :location, 2 }
  let(:location) { build :location, id: 1 }

  before do
    sign_in create(:user)
  end

  describe 'GET #index' do
    before do
      Location.stub(:scoped) { locations }
      locations.stub(:where) { locations }

      get 'index', format: 'json'
    end

    it_behaves_like 'a request with valid params', '200'

    it 'assigns locations' do
      expect(controller.locations).to eq locations
    end
  end

  describe 'GET #show' do
    before do
      Location.stub(:scoped) { locations }
      locations.stub(:find) { location }

      get 'show',
        id: location.id,
        format: 'json'
    end

    it_behaves_like 'a request with valid params', '200'

    it 'assigns location' do
      expect(controller.location).to eq location
    end
  end
end

require 'spec_helper'

describe LocationsController do
  let(:locations) { build_list :location, 2 }
  let(:location) { stub_model Location }
  let(:location_attributes) { attributes_for :location }

  before do
    sign_in create(:user)
  end

  describe 'GET #index' do
    before do
      Location.stub(:scoped) { locations }
      get 'index', format: 'json'
    end

    it_behaves_like 'a request with valid params', '200'

    it 'assigns unit_locations' do
      expect(controller.unit_locations).to eq locations
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

    it 'assigns unit_location' do
      expect(controller.unit_location).to eq location
    end
  end

  describe 'POST #create' do
    before do
      Location.any_instance.stub(:save) { true }

      post 'create',
        location: location_attributes,
        format: 'json'
    end

    it_behaves_like 'a request with valid params', '201'
  end

  describe 'PUT #update' do
    let!(:location) { stub_model Location }

    before do
      Location.stub(:find) { location }
      location.stub(:save) { true }

      put 'update',
        id: location.id,
        location: location_attributes,
        format: 'json'
    end

    it_behaves_like 'a request with valid params', '200'
  end
end

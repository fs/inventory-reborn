require 'spec_helper'

describe 'resource location' do
  let!(:user) { create :user }
  let(:params) { { authentication_token: user.authentication_token } }
  let(:location_attributes) { attributes_for(:location) }
  let(:params_with_location_attributes) { params.merge(location: location_attributes) }
  subject { json_response_body }

  describe 'list' do
    let!(:locations) { create_list :location, 2 }
    let(:method) { :get }
    let(:url) { '/locations' }

    it_behaves_like 'a method that requires an authentication'

    context 'with authentication token' do
      before { get url, params }

      its(:first) { should be_a_location_representation(locations.first) }
      its(:count) { should eq(2) }
    end
  end

  describe 'single' do
    let!(:location) { create :location }
    let(:method) { :get }
    let(:url) { "/locations/#{location.id}" }

    it_behaves_like 'a method that requires an authentication'

    context 'with authentication token' do
      before { get url, params }

      it { should be_a_location_representation(location) }
    end
  end

  describe 'POST /locations' do
    let(:method) { :post }
    let(:url) { "/locations" }

    it_behaves_like 'a method that requires an authentication'

    context 'with authentication token' do
      before { post url, params_with_location_attributes }

      it { should be_a_location_representation(Location.last) }
    end
  end

  describe 'PUT /locations/:id' do
    let!(:location) { create :location }
    let(:method) { :put }
    let(:url) { "/locations/#{location.id}" }

    it_behaves_like 'a method that requires an authentication'

    context 'with authentication token' do
      before do
        put url, params_with_location_attributes

        location.assign_attributes(location_attributes)
      end

      it { should be_a_location_representation(location) }
    end
  end
end

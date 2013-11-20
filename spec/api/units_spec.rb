require 'spec_helper'

describe 'resource units' do
  let!(:user) { create :user }
  let!(:location) { create :location }
  let(:params) { { authentication_token: user.authentication_token } }
  let(:params_with_unit_attributes) { params.merge(unit: unit_attributes) }
  let(:unit_attributes) do
    attributes_for(:unit).
      merge(location_id: location.id, user_id: user.id)
  end
  subject { json_response_body }

  describe 'list' do
    let!(:units) { create_list :unit, 2 }
    let!(:user_units) { create_list :unit, 2, user: user }
    let!(:location_units) { create_list :unit, 2, location: location }

    describe 'GET /units' do
      let(:method) { :get }
      let(:url) { '/units' }

      it_behaves_like 'a method that requires an authentication'

      context 'with authentication token' do
        before { get url, params }

        it { should be_a_kind_of Array }
        its(:first) { should be_a_unit_representation(units.first) }
        its(:count) { should eq(6) }

        context 'have user' do
          subject { json_response_body.first['user'] }
          it { should be_a_user_representation(units.first.user) }
        end

        context 'have location' do
          subject { json_response_body.first['location'] }
          it { should be_a_location_representation(units.first.location) }
        end
      end
    end

    describe 'GET /users/:id/units' do
      let(:method) { :get }
      let(:url) { "/users/#{user.id}/units" }

      it_behaves_like 'a method that requires an authentication'

      context 'with authentication token' do
        before { get url, params }

        it { should be_a_kind_of Array }
        its(:first) { should be_a_unit_representation(user_units.first) }
        its(:count) { should eq(2) }

        context 'without user' do
          subject { json_response_body.first['user'] }
          it { should be_nil }
        end

        context 'have location' do
          subject { json_response_body.first['location'] }
          it { should be_a_location_representation(user_units.first.location) }
        end
      end
    end

    describe 'GET /locations/:id/units' do
      let(:method) { :get }
      let(:url) { "/locations/#{location.id}/units" }

      it_behaves_like 'a method that requires an authentication'

      context 'with authentication token' do
        before { get url, params }

        it { should be_a_kind_of Array }
        its(:first) { should be_a_unit_representation(location_units.first) }
        its(:count) { should eq(2) }

        context 'have user' do
          subject { json_response_body.first['user'] }
          it { should be_a_user_representation(location_units.first.user) }
        end

        context 'without location' do
          subject { json_response_body.first['location'] }
          it { should be_nil }
        end
      end
    end
  end

  describe 'GET /units/:id' do
    let!(:unit) { create :unit, user: user, location: location }
    let(:method) { :get }
    let(:url) { "/units/#{unit.id}" }

    it_behaves_like 'a method that requires an authentication'

    context 'with authentication token' do
      before { get url, params }

      it { should be_a_unit_representation(unit) }

      context 'have user' do
        subject { json_response_body['user'] }
        it { should be_a_user_representation(user) }
      end

      context 'have location' do
        subject { json_response_body['location'] }
        it { should be_a_location_representation(location) }
      end
    end
  end

  describe 'POST /units' do
    let(:method) { :post }
    let(:url) { "/units" }

    it_behaves_like 'a method that requires an authentication'

    context 'with authentication token' do
      before { post url, params_with_unit_attributes }

      it { should be_a_unit_representation(user.units.last) }
    end
  end

  describe 'PUT /units/:id' do
    let!(:unit) { create :unit, user: user, location: location }
    let(:method) { :put }
    let(:url) { "/units/#{unit.id}" }

    it_behaves_like 'a method that requires an authentication'

    context 'with authentication token' do
      before do
        put url, params_with_unit_attributes

        unit.assign_attributes(unit_attributes)
      end

      it { should be_a_unit_representation(unit) }
    end
  end
end

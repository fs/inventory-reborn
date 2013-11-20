require 'spec_helper'

describe UnitsController do
  let(:units) { build_list :unit, 2 }
  let(:unit) { build :unit, id: 1 }
  let(:location) { build :location, id: 1 }
  let(:user) { build :user, id: 1 }
  let(:unit_attributes) do
    attributes_for(:unit).merge(location_id: location.id, user_id: user.id)
  end

  before do
    sign_in create(:user)
  end

  describe 'GET #index' do
    before do
      controller.unit_fetcher.stub(:units) { units }
      get 'index', format: 'json'
    end

    it_behaves_like 'a request with valid params', '200'

    it 'assigns units' do
      expect(controller.units).to eq units
    end
  end

  describe 'GET #show' do
    before do
      Unit.stub(:scoped) { units }
      units.stub(:includes) { units }
      units.stub(:find) { unit }

      get 'show',
        id: unit.id,
        format: 'json'
    end

    it_behaves_like 'a request with valid params', '200'

    it 'assigns unit' do
      expect(controller.unit).to eq unit
    end
  end

  context 'update and create' do
    before do
      Location.stub(:find) { location }
      User.stub(:find) { user }
      location.stub(:persisted?) { true }
    end

    describe 'POST #create' do
      before do
        post 'create',
          unit: unit_attributes,
          format: 'json'
      end

      it_behaves_like 'a request with valid params', '201'
    end

    describe 'PUT #update' do
      before do
        Unit.stub(:scoped) { units }
        units.stub(:includes) { units }
        units.stub(:find) { unit }

        put 'update',
          id: unit.id,
          unit: unit_attributes,
          format: 'json'
      end

      it_behaves_like 'a request with valid params', '200'

      it 'assign attributes to unit' do
        expect(controller.unit).to eq unit
      end
    end
  end
end

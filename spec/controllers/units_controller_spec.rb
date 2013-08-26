require 'spec_helper'

describe UnitsController do
  before do
    sign_in(FactoryGirl.create(:user))
  end

  describe 'GET #index' do
    let(:units) { FactoryGirl.build_list :unit, 2 }

    it 'returns http success' do
      get 'index', format: 'json'

      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'assigns units' do
      controller.unit_fetcher.stub(:units) { units }
      get 'index', format: 'json'

      expect(controller.units).to eq units
    end
  end

  describe 'GET #show' do
    let(:unit) { FactoryGirl.build :unit, id: 1 }
    let(:units) { [unit] }

    before do
      Unit.stub(:scoped) { units }
      units.stub(:includes) { units }
      units.stub(:find) { unit }

      get 'show',
        id: unit.id,
        format: 'json'
    end

    it 'returns http success' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'assigns unit' do
      expect(controller.unit).to eq unit
    end
  end

  context 'update and create' do
    let(:room) { FactoryGirl.build :room, id: 1 }
    let(:user) { FactoryGirl.build :user, id: 1 }
    let(:unit_attributes) do
      FactoryGirl.attributes_for(:unit).
        merge(room_id: room.id, user_id: user.id)
    end

    before do
      Room.stub(:find) { room }
      User.stub(:find) { user }
      room.stub(:persisted?) { true }
    end

    describe 'POST #create' do
      before do
        post 'create',
          unit: unit_attributes,
          format: 'json'
      end

      it 'returns http success' do
        expect(response).to be_success
        expect(response.code).to eq '201'
      end
    end

    describe 'PUT #update' do
      let(:unit) { FactoryGirl.build :unit, id: 1 }
      let(:units) { [unit] }

      before do
        Unit.stub(:scoped) { units }
        units.stub(:includes) { units }
        units.stub(:find) { unit }

        put 'update',
          id: unit.id,
          unit: unit_attributes,
          format: 'json'
      end

      it 'returns http success' do
        expect(response).to be_success
        expect(response.code).to eq '200'
      end

      it 'assign attributes to unit' do
        expect(controller.unit).to eq unit
      end
    end
  end
end

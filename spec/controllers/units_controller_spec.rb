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
    end

    it 'returns http success' do
      get 'show',
        id: unit.id,
        format: 'json'

      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'assigns unit' do
      get 'show',
        id: unit.id,
        format: 'json'

      expect(controller.unit).to eq unit
    end
  end

  describe 'POST #create' do
    let(:room) { FactoryGirl.build :room }
    let(:user) { FactoryGirl.build :user }

    before do
      Room.stub(:find) { room }
      User.stub(:find) { user }
      room.stub(:persisted?) { true }

      post 'create',
        unit: {
          unit_type: 'Monitor',
          inv_id: 105,
          name: 'Acer X243HQ',
          description: '',
          room_id: 1,
          user_id: 1
        },
        format: 'json'

    end

    it 'returns http success' do
      expect(response).to be_success
      expect(response.code).to eq '201'
    end
  end

  describe 'PUT #update' do
    before do
      Room.stub(:find) { room }
      User.stub(:find) { user }
      Unit.stub(:find) { unit }
      room.stub(:persisted?) { true }

    end

    it 'allows unit to be updated' do
      put 'update',
      unit: {
        unit_type: 'Monitor',
        inv_id: 105,
        name: 'Asus',
        description: '',
        room_id: 1,
        user_id: 1
      },
      format: 'json'
      response.shoul be_successful
    end
    # it 'returns http success' do
    #   expect(response).to be_success
    #   expect(response.code).to eq '201'
    # end
  end      
end

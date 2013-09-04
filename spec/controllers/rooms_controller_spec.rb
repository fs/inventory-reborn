require 'spec_helper'

describe RoomsController do
  before do
    sign_in(FactoryGirl.create(:user))
  end

  describe 'GET #index' do
    let(:rooms) { FactoryGirl.build_list :room, 2 }
 
    it 'returns http success' do
      get 'index', format: 'json'

      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'assigns rooms' do
      Room.stub(:scoped) { rooms }
      rooms.stub(:where) { rooms }
      get 'index', format: 'json'

      expect(controller.rooms).to eq rooms
    end
  end
end
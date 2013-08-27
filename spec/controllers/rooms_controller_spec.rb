require 'spec_helper'

describe RoomsController do
  before do
    sign_in(FactoryGirl.create(:user))
  end

  describe 'GET #index' do
    let(:rooms) { FactoryGirl.build_list :room, 2 }

    before do
      get 'index', format: 'json'
    end  

    it 'returns http success' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'assigns rooms' do
      controller.stub(:rooms) { rooms }
      expect(controller.rooms).to eq rooms
    end
  end

end
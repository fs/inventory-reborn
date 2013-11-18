require 'spec_helper'

describe RoomsController do
  let(:rooms) { build_list :room, 2 }
  let(:room) { build :room, id: 1 }

  before do
    sign_in create(:user)
  end

  describe 'GET #index' do
    before do
      Room.stub(:scoped) { rooms }
      rooms.stub(:where) { rooms }

      get 'index', format: 'json'
    end
 
    it_behaves_like 'a request with valid params', '200'

    it 'assigns rooms' do
      expect(controller.rooms).to eq rooms
    end
  end

  describe 'GET #show' do
    before do
      Room.stub(:scoped) { rooms }
      rooms.stub(:find) { room }

      get 'show',
        id: room.id,
        format: 'json'
    end

    it_behaves_like 'a request with valid params', '200'

    it 'assigns room' do
      expect(controller.room).to eq room
    end
  end
end

require 'spec_helper'

describe 'resource room' do
  let!(:user) { FactoryGirl.create :user }

  describe 'list' do
    let!(:rooms) { FactoryGirl.create_list :room, 2 }

    context 'GET rooms.json' do

      context 'without authentication token' do
        before do
          get '/rooms.json'
        end

        it 'responds unauthorized with an HTTP 401 status code' do
          expect(response.code).to eq('401')
        end
      end

      context 'with authentication token' do
        before do
          get '/rooms.json',
            authentication_token: user.authentication_token
        end

        subject { json_response_body }
        it { should be_a_kind_of Array }
        its(:first) { should be_a_room_representation(rooms.first) }
        its(:count) { should eq(2) }
      end
    end
  end

  describe 'single' do
    let!(:room) { FactoryGirl.create :room, id: 1}

    context 'GET /rooms/:id.json' do
      context 'without authentication token' do
        before do
          get '/rooms/',
            id: room.id,
            format: 'json'
        end

        it 'responds unauthorized with an HTTP 401 status code' do
          expect(response.code).to eq('401')
        end
      end

      context 'with authentication token' do
        before do
          get '/rooms/',
              id: room.id,
              authentication_token: user.authentication_token,
              format: 'json'
        end

        subject { json_response_body }
        it { should be_a_room_representation(room) }
      end
    end
  end
end
require 'spec_helper'

describe 'resource units' do
  let!(:user) { FactoryGirl.create :user }
  let!(:room) { FactoryGirl.create :room }

  describe 'list' do
    let!(:units) { FactoryGirl.create_list :unit, 2 }
    let!(:user_units) { FactoryGirl.create_list :unit, 2, user: user }
    let!(:room_units) { FactoryGirl.create_list :unit, 2, room: room }

    context 'GET /units.json' do
      context 'without authentication token' do
        before do
          get '/units.json'
        end

        it 'responds unauthorized with an HTTP 401 status code' do
          expect(response.code).to eq('401')
        end
      end

      context 'with authentication token' do
        before do
          get '/units.json',
            authentication_token: user.authentication_token
        end

        subject { json_response_body }
        it { should be_a_kind_of Array }
        its(:first) { should be_a_unit_representation(units.first) }
        its(:count) { should eq(6) }

        context 'have user' do
          subject { json_response_body.first['user'] }
          it { should be_a_user_representation(units.first.user) }
        end

        context 'have room' do
          subject { json_response_body.first['room'] }
          it { should be_a_room_representation(units.first.room) }
        end
      end
    end

    context 'GET /users/:id/units.json' do
      context 'without authentication token' do
        before do
          get "/users/#{user.id}/units.json"
        end

        it 'responds unauthorized with an HTTP 401 status code' do
          expect(response.code).to eq('401')
        end
      end

      context 'with authentication token' do
        before do
          get "/users/#{user.id}/units.json",
            authentication_token: user.authentication_token
        end

        subject { json_response_body }
        it { should be_a_kind_of Array }
        its(:first) { should be_a_unit_representation(user_units.first) }
        its(:count) { should eq(2) }

        context 'without user' do
          subject { json_response_body.first['user'] }
          it { should be_nil }
        end

        context 'have room' do
          subject { json_response_body.first['room'] }
          it { should be_a_room_representation(user_units.first.room) }
        end
      end
    end

    context 'GET /rooms/:id/units.json' do
      context 'without authentication token' do
        before do
          get "/rooms/#{room.id}/units.json"
        end

        it 'responds unauthorized with an HTTP 401 status code' do
          expect(response.code).to eq('401')
        end
      end

      context 'with authentication token' do
        before do
          get "/rooms/#{room.id}/units.json",
            authentication_token: user.authentication_token
        end

        subject { json_response_body }
        it { should be_a_kind_of Array }
        its(:first) { should be_a_unit_representation(room_units.first) }
        its(:count) { should eq(2) }

        context 'have user' do
          subject { json_response_body.first['user'] }
          it { should be_a_user_representation(room_units.first.user) }
        end

        context 'without room' do
          subject { json_response_body.first['room'] }
          it { should be_nil }
        end
      end
    end
  end

  describe 'single' do
    let!(:unit) { FactoryGirl.create :unit, user: user, room: room }

    context 'GET /units/:id.json' do
      context 'without authentication token' do
        before do
          get '/units/:id.json'
        end

        it 'responds unauthorized with an HTTP 401 status code' do
          expect(response.code).to eq('401')
        end
      end

      context 'with authentication token' do
        before do
          get "/units/#{unit.id}.json",
            authentication_token: user.authentication_token
        end

        subject { json_response_body }
        it { should be_a_unit_representation(unit) }

        context 'have user' do
          subject { json_response_body['user'] }
          it { should be_a_user_representation(user) }
        end

        context 'have room' do
          subject { json_response_body['room'] }
          it { should be_a_room_representation(room) }
        end
      end
    end
  end

  describe 'POST /units' do
    context 'without authentication token' do
      before do
        post '/units.json'
      end

      it 'responds unauthorized with an HTTP 401 status code' do
        expect(response.code).to eq('401')
      end
    end

    context 'with authentication token' do
      before do
        post "/units.json",
          authentication_token: user.authentication_token,
          unit: {
            unit_type: 'Monitor',
            inv_id: 105,
            name: 'Acer X243HQ',
            description: '',
            room_id: room.id,
            user_id: user.id
          }
      end

      subject { json_response_body }
      it { should be_a_unit_representation(user.units.last) }
    end
  end
end

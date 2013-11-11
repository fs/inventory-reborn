require 'spec_helper'

describe 'resource room' do
  let!(:user) { create :user }
  let(:params) { { authentication_token: user.authentication_token } }
  subject { json_response_body }

  describe 'list' do
    let!(:rooms) { create_list :room, 2 }
    let(:method) { :get }
    let(:url) { '/rooms' }

    it_behaves_like 'a method that requires an authentication'

    context 'with authentication token' do
      before { get url, params }

      it { should be_a_kind_of Array }
      its(:first) { should be_a_room_representation(rooms.first) }
      its(:count) { should eq(2) }
    end
  end

  describe 'single' do
    let!(:room) { create :room }
    let(:method) { :get }
    let(:url) { "/rooms/#{room.id}" }

    it_behaves_like 'a method that requires an authentication'

    context 'with authentication token' do
      before { get url, params }

      it { should be_a_room_representation(room) }
    end
  end
end

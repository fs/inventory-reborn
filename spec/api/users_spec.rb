require 'spec_helper'

describe 'resource users' do 

  describe 'list' do 
    let!(:users) { FactoryGirl.create_list :user, 2 }
    let!(:user) { users.first }

    context 'GET /users.json' do
      context 'without authentication token' do
        before do
          get '/users.json'
        end

        it 'responds unauthorized with an HTTP 401 status code' do
          expect(response.code).to eq('401')
        end
      end

      context 'with authentication token' do
        before do
          get '/users.json',
            authentication_token: user.authentication_token
        end

        subject { json_response_body }
        it { should be_a_kind_of Array }
        its(:first) { should be_a_user_representation(user) }
        its(:count) { should eq(2) }

      end
    end
  end
end
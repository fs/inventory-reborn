require 'spec_helper'

describe 'resource users' do 
  describe 'list' do 
    let!(:users) { create_list :user, 2 }
    let!(:user) { users.first }
    let(:params) { { authentication_token: user.authentication_token } }
    subject { json_response_body }

    context 'GET /users' do
      let(:method) { :get }
      let(:url) { '/users' }
     
      it_behaves_like 'a method that requires an authentication'

      context 'with authentication token' do
        before { get url, params }

        it { should be_a_kind_of Array }
        its(:first) { should be_a_user_representation(user) }
        its(:count) { should eq(2) }
      end
    end
  end
end

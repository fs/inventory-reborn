require 'spec_helper'

describe '/users/sign_in' do
  subject { json_response_body }

  describe 'sign in' do
    let(:url) { '/users/sign_in' }

    context 'with valid credentials' do
      let(:user) { create :user, password: '123456' }
      let(:params) do
        {
          email: user.email,
          password: '123456'
        }
      end

      before { post url, params }

      it { should be_a_full_user_representation(user) }
    end

    context 'with invalid credentials' do
      let(:method) { :post }

      it_behaves_like 'a method that requires an authentication'
    end
  end
end

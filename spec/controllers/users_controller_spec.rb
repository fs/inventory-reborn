require 'spec_helper'

describe UsersController do
  before do
    sign_in FactoryGirl.create(:user)
  end

  describe "users index" do
    let(:users) { FactoryGirl.build_list :user, 2 }

    before do
      get 'index', format: 'json'
    end

    it 'returns http success' do
      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'assigns users' do
      controller.stub(:users) { users }
      expect(controller.users).to eq users
    end
  end
end
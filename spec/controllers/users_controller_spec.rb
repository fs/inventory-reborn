require 'spec_helper'

describe UsersController do
  before do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET #index" do
    let(:users) { FactoryGirl.build_list :user, 2 }

    it 'returns http success' do
      get 'index', format: 'json'

      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it 'assigns users' do
      User.stub(:scoped) { users }
      users.stub(:where) { users }
      get 'index', format: 'json'

      expect(controller.users).to eq users
    end
  end
end
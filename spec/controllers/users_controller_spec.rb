require 'spec_helper'

describe UsersController do
  let(:user) { create :user }
  let(:users) { [user] }

  before do
    sign_in user
  end

  describe "GET #index" do
    before do
      User.stub(:scoped) { users }
      users.stub(:where) { users }

      get 'index', format: 'json'
    end

    it_behaves_like 'a request with valid params', '200'

    it 'assigns users' do
      expect(controller.users).to eq users
    end
  end
end

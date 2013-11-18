require 'spec_helper'

describe SessionsController do
  before do
    set_devise_mapping(:user)
  end

  describe 'POST #create' do
    before do
      AuthenticationService.
        any_instance.
        should_receive(:authenticate!) { build :user }

      post :create,
        format: :json
    end

    it_behaves_like 'a request with valid params', '201'
  end
end

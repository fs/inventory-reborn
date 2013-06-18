require 'spec_helper'

describe UnitsController do
  before do
    sign_in(FactoryGirl.create(:user))
  end

  describe "GET 'index'" do
    let(:units) { FactoryGirl.build_list :unit, 2 }

    it "returns http success" do
      get 'index', format: 'json'

      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it "assigns all units" do
      Unit.stub(:scoped) { units }
      units.stub(:includes) { units }
      get 'index', format: 'json'

      expect(controller.units).to eq units
    end

    it "assigns user units" do
      controller.user.stub(:units) { units }
      get 'index', format: 'json'

      expect(controller.units).to eq units
    end

    it "assigns user units" do
      controller.room.stub(:units) { units }
      get 'index', format: 'json'

      expect(controller.units).to eq units
    end
  end
end

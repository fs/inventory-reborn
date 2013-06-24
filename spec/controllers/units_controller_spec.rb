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

    it "assigns units" do
      controller.unit_fetcher.stub(:units) { units }
      get 'index', format: 'json'

      expect(controller.units).to eq units
    end
  end

  describe "GET 'show'" do
    let(:unit) { FactoryGirl.build :unit, id: 1 }
    let(:units) { [unit] }

    before do
      Unit.stub(:scoped) { units }
      units.stub(:includes) { units }
      units.stub(:find) { unit }
    end

    it "returns http success" do
      get 'show',
        id: unit.id,
        format: 'json'

      expect(response).to be_success
      expect(response.code).to eq '200'
    end

    it "assigns unit" do
      get 'show',
        id: unit.id,
        format: 'json'

      expect(controller.unit).to eq unit
    end
  end
end

require 'spec_helper'

describe UnitSerializer do
  let(:unit) { FactoryGirl.build :unit, id: 1 }
  let(:json) { UnitSerializer.new(unit).to_json }

  subject { JSON.parse(json) }

  it { should be_a_unit_representation(unit) }
end

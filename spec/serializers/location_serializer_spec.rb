require 'spec_helper'

describe LocationSerializer do
  let(:location) { build :location, id: 1 }
  let(:json) { LocationSerializer.new(location).to_json }

  subject { JSON.parse(json) }

  it { should be_a_location_representation(location) }
end

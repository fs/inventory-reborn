require 'spec_helper'

describe FetchUnits::GetAncestors do
  let(:service) { described_class.perform user: user, location: location }
  let(:user) { stub_model User, persisted?: false }
  let(:location) { stub_model Location, persisted?: false }

  it 'should return user and location' do
    expect(service.ancestors).to  eq [:user, :location]
  end

  it 'should return user' do
    location.stub(:persisted?) { true }
    expect(service.ancestors).to  eq [:user]
  end

  it 'should return location' do
    user.stub(:persisted?) { true }
    expect(service.ancestors).to  eq [:location]
  end
end

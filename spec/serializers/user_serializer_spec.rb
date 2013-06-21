require 'spec_helper'

describe UserSerializer do
  let(:user) { FactoryGirl.build :user, id: 1, authentication_token: 'token' }

  context 'full representation' do
    let(:json) { UserSerializer.new(user, full_representation: true).to_json }
    subject { JSON.parse(json) }

    it { should be_a_full_user_representation(user) }
  end

  context 'base representation' do
    let(:json) { UserSerializer.new(user).to_json }
    subject { JSON.parse(json) }

    it { should be_a_user_representation(user) }
    it { should_not be_a_full_user_representation(user) }
  end
end

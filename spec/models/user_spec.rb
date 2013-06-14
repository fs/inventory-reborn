require 'spec_helper'

describe User do
  describe 'validations' do
    context 'uniqueness' do
      subject { FactoryGirl.create :user }
      it { should validate_uniqueness_of :email }
    end
  end

  describe 'associations' do
    it { should have_many :units }
    it { should have_and_belong_to_many :roles }
  end
end

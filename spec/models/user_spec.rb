require 'spec_helper'

describe User do
  describe 'validations' do
    context 'uniqueness' do
      it { should validate_uniqueness_of :email }
    end
  end

  describe 'associations' do
    it { should have_many :units }
  end
end

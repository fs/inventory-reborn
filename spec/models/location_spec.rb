require 'spec_helper'

describe Location do
  describe 'associations' do
    it { should have_many :units }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end

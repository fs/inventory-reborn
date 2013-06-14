require 'spec_helper'

describe Role do
  describe 'associations' do
    it { should have_and_belong_to_many :users}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end

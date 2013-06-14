require 'spec_helper'

describe Unit do
  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :room }
  end

  describe 'validations' do
    context 'presence' do
      it { should validate_presence_of :name }
      it { should validate_presence_of :unit_type }
      it { should validate_presence_of :room }
      it { should validate_presence_of :user }
    end

    context 'uniqueness' do
      it { should validate_uniqueness_of :inv_id }
    end

    context 'numericality' do
      it { should validate_numericality_of :inv_id }
    end
  end

  describe 'callbacks' do
  end
end

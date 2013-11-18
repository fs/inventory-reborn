require 'spec_helper'

describe Unit do
  let(:unit) { build :unit }

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
      it { should validate_presence_of :inv_id }

      context 'out_of_order_note' do
        it 'skip validation with out_of_order is not true' do
          unit.out_of_order = false
          unit.out_of_order_note = nil
          unit.should be_valid
        end

        it 'validates presence if out_of_order is true' do
          unit.out_of_order_note = nil
          unit.should_not be_valid
        end
      end
    end

    context 'uniqueness' do
      it { should validate_uniqueness_of :inv_id }
    end

    context 'numericality' do
      it { should validate_numericality_of :inv_id }
    end
  end
end

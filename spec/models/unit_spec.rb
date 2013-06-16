require 'spec_helper'

describe Unit do
  let(:unit) { FactoryGirl.build :unit }

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

  describe 'callbacks' do
    context 'before validation' do
      it 'generate next inv_id' do
        unit.inv_id = nil
        expect { unit.valid? }.to change { unit.inv_id }.from(nil).to(1)
      end

      it 'callback not call' do
        expect { unit.valid? }.to change { unit.inv_id }.by(0)
      end
    end

    context 'before save' do
      let(:admin) { FactoryGirl.build(:user, :admin) }

      context 'on depot' do
        before do
          User.stub(:admins).and_return([admin])
          unit.on_depot = true
        end

        it 'receive reassign_user' do
          unit.should_receive(:reassign_user)
          unit.save!
        end

        it 'reassing user if on depot' do
          expect { unit.save! }.to change { unit.user }.to(admin)
        end
      end

      it 'not receive reassign_user' do
        unit.should_not_receive(:reassign_user)
        unit.save!
      end
    end
  end

  describe 'scopes' do
    it 'scoped by default scope' do
      Unit.scoped.to_sql.should == Unit.order('inv_id').to_sql
    end
  end
end

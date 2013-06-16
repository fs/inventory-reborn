require 'spec_helper'

describe Role do
  describe 'associations' do
    it { should have_and_belong_to_many :users}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe '.admin' do
    it 'receive find_or_create method' do
      Role.should_receive(:find_or_create_by_name).with('admin')
      Role.admin
    end

    it 'get admin if present' do
      admin = FactoryGirl.create(:role, :admin)

      Role.admin.should == admin
    end

    it 'create if not present' do
      expect { Role.admin }.to change { Role.count }.by(1)
    end
  end
end

require 'spec_helper'

describe User do
  describe 'validations' do
    context 'uniqueness' do
      it { should validate_uniqueness_of :email }
    end
  end

  describe 'associations' do
    it { should have_many :units }
    it { should have_and_belong_to_many :roles }
  end

  describe 'scopes' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:admin) { FactoryGirl.create(:user, :admin) }

    context '.admins' do
      it 'include admin' do
        User.admins.should include(admin)
      end

      it 'not include user' do
        User.admins.should_not include(user)
      end
    end
  end
end

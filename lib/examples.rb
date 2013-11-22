module Examples
  extend self

  def user
    @user ||= User.first
  end

  def password
    '123456'
  end

  def location
    @location ||= Location.first_or_create FactoryGirl.attributes_for(:location)
  end

  def unit
    @unit ||= Unit.first_or_create FactoryGirl.attributes_for(:unit, user: user, location: location)
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create :user

      FactoryGirl.create :location

      FactoryGirl.create_list :unit, 3, user: user, location: location
    end
  end
end

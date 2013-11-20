module Examples
  extend self

  def user
    @user ||= User.first
  end

  def password
    '123456'
  end

  def location
    @location ||= Location.first
  end

  def unit
    @unit ||= Unit.first
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create :user

      FactoryGirl.create :location

      FactoryGirl.create_list :unit, 3, user: user, location: location
    end
  end
end

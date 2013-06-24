module Examples
  extend self

  def user
    @user ||= User.first
  end

  def password
    '123456'
  end

  def room
    @room ||= Room.first
  end

  def unit
    @unit ||= Unit.first
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create :user

      FactoryGirl.create :room

      FactoryGirl.create_list :unit, 3, user: user, room: room
    end
  end
end

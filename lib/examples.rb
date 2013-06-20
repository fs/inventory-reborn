module Examples
  extend self

  def user
    User.first
  end

  def password
    '123456'
  end

  def room
    Room.first
  end

  def setup!
    ActiveRecord::Base.transaction do
      FactoryGirl.create :user

      FactoryGirl.create :room

      FactoryGirl.create_list :unit, 3, user: user, room: room
    end
  end
end

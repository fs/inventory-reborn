class UnitFetcher
  include Interactor

  def perform
    get_units
    get_ancestors
  end

  private

  def get_units
    context[:units] = user.units.presence || room.units.presence || Unit.includes(:user, :room)
  end

  def get_ancestors
    context[:ancestors] = if user.persisted?
      [:room]
    elsif room.persisted?
      [:user]
    else
      [:user, :room]
    end
  end

  def user
    @user ||= context['user_id'] ? User.find(context['user_id']) : User.new
  end

  def room
    @room ||= context['room_id'] ? Room.find(context['room_id']) : Room.new
  end
end

class UnitFetcher
  include Interactor

  def perform
    context[:units] = units
    context[:ancestors] = ancestors
  end

  private

  def units
    user.units.presence || room.units.presence || Unit.includes(:user, :room)
  end

  def ancestors
    if user.persisted?
      [:room]
    elsif room.persisted?
      [:user]
    else
      [:user, :room]
    end
  end

  def user
    @user ||= context[:user_id] ? User.find(@params[:user_id]) : User.new
  end

  def room
    @room ||= context[:room_id] ? Room.find(@params[:room_id]) : Room.new
  end
end

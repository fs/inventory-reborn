class UnitFetcher
  def initialize(params = {})
    @params = params
  end

  def units
    user.units.presence || room.units.presence || Unit.includes(:user, :room)
  end

  def ancestors
    ancestors = [:user, :room]
    {user: user, room: room}.each { |k, v| ancestors.delete(k) if v.persisted? }
    ancestors
  end

  private

  def user
    @user ||= @params[:user_id] ? User.find(@params[:user_id]) : User.new
  end

  def room
    @room ||= @params[:room_id] ? Room.find(@params[:room_id]) : Room.new
  end
end

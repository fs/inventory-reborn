class UnitFetcher
  include Interactor

  def perform
    get_units
    get_ancestors
  end

  private

  def get_units
    context[:units] = user.units.presence || location.units.presence || Unit.includes(:user, :location)
  end

  def get_ancestors
    context[:ancestors] = if user.persisted?
      [:location]
    elsif location.persisted?
      [:user]
    else
      [:user, :location]
    end
  end

  def user
    @user ||= context['user_id'] ? User.find(context['user_id']) : User.new
  end

  def location
    @location ||= context['location_id'] ? Location.find(context['location_id']) : Location.new
  end
end

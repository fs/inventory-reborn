class FetchUnits::GetUnits
  include Interactor

  def perform
    context[:units] = if user.persisted?
      user.units
    elsif location.persisted?
      location.units
    else
      Unit.includes(:user, :location)
    end
  end

  private

  def user
    context[:user] = respond_to?(:user_id) ? User.find(user_id) : User.new
  end

  def location
    context[:location] = respond_to?(:location_id) ? Location.find(location_id) : Location.new
  end
end

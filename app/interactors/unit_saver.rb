class UnitSaver
  include Interactor

  def setup
    @unit = context[:unit]
    @params = context[:unit_params]
  end

  def perform
    @unit.assign_attributes(unit_params)
    @unit.user = user
    @unit.location = location

    @unit.save!
  end

  private

  def location
    @location ||= Location.find(@params[:location_id])
  end

  def user
    @user ||= User.find(@params[:user_id])
  end

  def unit_params
    @unit_params ||= @params.except(:location_id, :user_id).permit(:unit_type, :inv_id, :name,
      :description, :on_depot, :out_of_order, :out_of_order_note)
  end
end

class UnitSaver
  def initialize(unit, user, params = {})
    @unit = unit
    @user = user
    @params = params
  end

  def create!
    @unit.assign_attributes(unit_params)
    @unit.user = @user
    @unit.room = room

    @unit.save!
  end

  private

  def room
    @room ||= Room.find(@params[:room_id])
  end

  def unit_params
    @unit_params ||= @params.except(:room_id).permit(:unit_type, :inv_id, :name,
      :description, :on_depot, :out_of_order, :out_of_order_note)
  end
end

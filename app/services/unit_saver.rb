class UnitSaver
  def initialize(unit, params = {})
    @unit = unit
    @params = params
  end

  def create!
    save!
  end

  def update!
    save!
  end

  private

  def save!
    @unit.assign_attributes(unit_params)
    @unit.user = user
    @unit.room = room

    @unit.save!
  end

  def room
    @room ||= Room.find(@params[:room_id])
  end

  def user
    @user ||= User.find(@params[:user_id])
  end

  def unit_params
    @unit_params ||= @params.except(:room_id, :user_id).permit(:unit_type, :inv_id, :name,
      :description, :on_depot, :out_of_order, :out_of_order_note)
  end
end

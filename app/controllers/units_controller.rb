class UnitsController < ApplicationController
  before_filter :authenticate_user!

  expose(:room) { Room.find(params[:unit][:room_id]) }
  expose(:unit_fetcher) { UnitFetcher.new(params) }
  expose(:units) { unit_fetcher.units }
  expose(:unit, attributes: :unit_params)

  def index
    respond_with units,
      serializer_includes: {
        unit: unit_fetcher.ancestors
      }
  end

  def show
    respond_with unit,
      serializer_includes: {
        unit: [:user, :room]
      }
  end

  def create
    unit.room = room if room.persisted?
    unit.user = current_user
    unit.save!

    respond_with unit
  end

  private

  def unit_params
    params.require(:unit).except(:room_id).permit(:unit_type, :inv_id, :name,
      :description, :on_depot, :out_of_order, :out_of_order_note)
  end
end

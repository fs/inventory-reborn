class UnitsController < ApplicationController
  before_filter :authenticate_user!

  expose(:service) { FetchUnits.perform params.slice(:user_id, :location_id).symbolize_keys }
  expose(:units) { service.units }
  expose(:unit)

  def index
    respond_with units,
      serializer_includes: {
        unit: service.ancestors
      }
  end

  def show
    respond_with unit,
      serializer_includes: {
        unit: [:user, :location]
      }
  end

  def create
    SaveUnit.perform(unit: unit, params: params[:unit])

    respond_with unit
  end

  def update
    SaveUnit.perform(unit: unit, params: params[:unit])

    respond_with unit
  end
end

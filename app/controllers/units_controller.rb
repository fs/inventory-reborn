class UnitsController < ApplicationController
  before_filter :authenticate_user!

  expose(:unit_fetcher) { UnitFetcher.perform(params) }
  expose(:units) { unit_fetcher.units }
  expose(:unit)

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
    UnitSaver.perform(unit: unit, unit_params: params[:unit])

    respond_with unit
  end
end

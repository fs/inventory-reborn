class UnitsController < ApplicationController
  before_filter :authenticate_user!

  expose(:unit_fetcher) { UnitFetcher.new(params) }
  expose(:unit_saver) { UnitSaver.new(unit, current_user, params[:unit]) }
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
    unit_saver.create!

    respond_with unit
  end
end

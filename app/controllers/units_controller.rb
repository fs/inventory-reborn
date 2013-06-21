class UnitsController < ApplicationController
  before_filter :authenticate_user!

  expose(:unit_fetcher) { UnitFetcher.new(params) }
  expose(:units) { unit_fetcher.units }

  def index
    respond_with units,
      serializer_includes: {
        unit: unit_fetcher.ancestors
      }
  end
end

class LocationsController < ApplicationController
  before_filter :authenticate_user!

  # We can't use loaction method b/c
  # it defined in the ActionController already
  expose(:unit_locations) { Location.scoped }
  expose(:unit_location, model: :location, attributes: :location_params)

  def index
    respond_with unit_locations
  end

  def show
    respond_with unit_location
  end

  def create
    unit_location.save

    respond_with unit_location
  end

  def update
    unit_location.save

    respond_with unit_location
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end
end

class LocationsController < ApplicationController
  before_filter :authenticate_user!

  # We can't use loaction method b/c
  # it defined in the ActionController already
  expose(:unit_locations) { Location.scoped }
  expose(:unit_location, model: :location)

  def index
    respond_with unit_locations
  end

  def show
    respond_with unit_location
  end
end

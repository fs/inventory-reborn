class LocationsController < ApplicationController
  before_filter :authenticate_user!

  expose(:locations)
  expose(:location)

  def index
    respond_with locations
  end

  def show
    respond_with location
  end
end

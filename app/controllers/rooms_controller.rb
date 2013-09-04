class RoomsController < ApplicationController
  before_filter :authenticate_user!

  expose(:rooms)

  def index
    respond_with rooms
  end
end
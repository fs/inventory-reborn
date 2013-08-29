class RoomsController < ApplicationController
  before_filter :authenticate_user!

  expose(:rooms)
  expose(:room)

  def index
    respond_with rooms
  end

  def show
    respond_with room
  end
end
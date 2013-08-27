class RoomsController < ApplicationController
  before_filter :authenticate_user!

  expose(:rooms) { Room.all }

  def index
    respond_with rooms
  end  
end  
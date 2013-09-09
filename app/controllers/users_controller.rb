class UsersController < ApplicationController
  before_filter :authenticate_user!

  expose(:users)

  def index
    respond_with users
  end
end
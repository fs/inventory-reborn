class UnitsController < ApplicationController
  before_filter :authenticate_user!

  expose(:user)
  expose(:room)
  expose(:units) { user.units.presence || room.units.presence || Unit.includes(:user, :room) }

  def index
    respond_with units,
      serializer_includes: {
        unit: declared_associations
      }
  end

  private

  def declared_associations
    ancestors = [:user, :room]
    {user: user, room: room}.each { |k, v| ancestors.delete(k) if v.persisted? }
    ancestors
  end
end

class UnitSerializer < BaseSerializer
  attributes :unit_type, :inv_id

  has_one :user, :room
end

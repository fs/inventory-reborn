class UnitSerializer < BaseSerializer
  attributes :unit_type, :inv_id, :name, :description, :on_depot, :out_of_order

  has_one :user, :room
end

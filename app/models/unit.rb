class Unit < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates :inv_id, presence: true, uniqueness: true, numericality: true
  validates :name, :unit_type, :location, :user, presence: true
  validates :out_of_order_note, presence: true, if: proc { |u| u.out_of_order? }
end

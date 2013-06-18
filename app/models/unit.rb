class Unit < ActiveRecord::Base
  default_scope order('inv_id')

  belongs_to :user
  belongs_to :room

  validates :inv_id, presence: true, uniqueness: true, numericality: true
  validates :name, :unit_type, :room, :user, presence: true
  validates :out_of_order_note, presence: true, if: proc { |u| u.out_of_order? }

  before_validation :generate_next_inv_id, if: proc { |u| u.inv_id.blank? }

  private

  def generate_next_inv_id
    self.inv_id = self.class.maximum(:inv_id).to_i + 1
  end
end

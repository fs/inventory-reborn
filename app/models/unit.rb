class Unit < ActiveRecord::Base
  default_scope order('inv_id')

  belongs_to :user
  belongs_to :room

  validates :inv_id, presence: true, uniqueness: true, numericality: true
  validates :name, :unit_type, :room, :user, presence: true
  validates :out_of_order_note, presence: true, if: :out_of_order_note_requried?

  before_validation :generate_next_inv_id
  before_save :reassign_user_if_on_depot

  private

  def generate_next_inv_id
    if inv_id.blank?
      self.inv_id = self.class.maximum(:inv_id).to_i + 1
    end
  end

  def reassign_user_if_on_depot
    if on_depot?
      self.user = User.includes(:roles).where(roles: {name: 'admin'}).first
    end
  end

  def out_of_order_note_requried?
    out_of_order == true
  end
end

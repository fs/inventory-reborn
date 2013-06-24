class Room < ActiveRecord::Base
  has_many :units, include: :user, order: :id

  validates :name, presence: true, uniqueness: true
end

class Room < ActiveRecord::Base
  has_many :units, include: :user

  validates :name, presence: true, uniqueness: true
end

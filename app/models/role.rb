class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true

  def self.admin
    find_or_create_by_name('admin')
  end
end

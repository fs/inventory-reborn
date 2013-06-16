class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,
         :token_authenticatable

  has_many :units
  has_and_belongs_to_many :roles

  before_save :ensure_authentication_token

  scope :admins, includes(:roles).where(roles: {name: 'admin'})
end

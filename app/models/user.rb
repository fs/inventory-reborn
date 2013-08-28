class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :token_authenticatable

  has_many :units, include: :room, order: :id

  before_save :ensure_authentication_token
end

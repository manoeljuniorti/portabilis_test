# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  enum role: { common: 0, admin: 1 }

  validates :name, :email, :role, presence: true
  validates :email, uniqueness: true

  scope :active, -> { where(active: true) }
end

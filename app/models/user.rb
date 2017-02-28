class User < ApplicationRecord
  has_many :links
  has_secure_password
  validates_confirmation_of :password
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end

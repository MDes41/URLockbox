class User < ApplicationRecord
  has_many :links
  has_secure_password
  validates_confirmation_of :password
end

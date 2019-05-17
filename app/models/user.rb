class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create

  has_secure_password
end

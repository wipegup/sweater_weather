class User < ApplicationRecord
  has_many :favorites
  
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create

  has_secure_token :api_key
  has_secure_password
end

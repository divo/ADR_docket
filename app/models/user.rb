class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :dockets
  has_many :addresses
  has_many :hazardous_goods
  has_secure_password
end

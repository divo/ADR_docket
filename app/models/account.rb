class Account < ApplicationRecord
  has_many :address
  has_many :dockets
end

class Company < ApplicationRecord
  belongs_to :address
  belongs_to :dockets
end

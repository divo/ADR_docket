class Address < ApplicationRecord
  has_many :deliver_to, class_name: 'Docket', foreign_key: 'deliver_to_id'
  has_many :collect_from, class_name: 'Docket', foreign_key: 'collect_from_id'
end

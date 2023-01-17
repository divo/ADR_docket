class Docket < ApplicationRecord
  belongs_to :deliver_to, class_name: 'Address', optional: true
  belongs_to :collect_from, class_name: 'Address', optional: true
  belongs_to :hazardous_good, optional: true
  belongs_to :user
end

class HazardousGood < ApplicationRecord
  has_many :docket

  def to_s
    "#{un_number} / #{name} / #{primary_class} / #{secondary_class} / #{packing_group} / #{tunnel_code}"
  end
end

json.extract! address, :id, :address, :lat, :long, :eircode, :created_at, :updated_at
json.url address_url(address, format: :json)

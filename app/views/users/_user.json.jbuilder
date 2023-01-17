json.extract! user, :id, :name, :company_name, :tagline, :address, :phone, :email, :created_at, :updated_at
json.url user_url(user, format: :json)

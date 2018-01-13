json.extract! user, :id, :login, :birthdate, :height, :sex, :created_at, :updated_at
json.url user_url(user, format: :json)

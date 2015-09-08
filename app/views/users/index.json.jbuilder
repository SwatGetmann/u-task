json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :rating
  json.url user_url(user, format: :json)
end

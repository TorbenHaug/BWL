json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :email, :password, :role, :deleted_at
  json.url user_url(user, format: :json)
end

json.array!(@shopping_cart_entries) do |shopping_cart_entry|
  json.extract! shopping_cart_entry, :id, :amount
  json.url shopping_cart_entry_url(shopping_cart_entry, format: :json)
end

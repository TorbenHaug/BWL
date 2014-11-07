json.array!(@menus) do |menu|
  json.extract! menu, :id, :name
  json.url menu_url(menu, format: :json)
end

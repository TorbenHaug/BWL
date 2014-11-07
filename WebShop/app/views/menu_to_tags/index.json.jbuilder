json.array!(@menu_to_tags) do |menu_to_tag|
  json.extract! menu_to_tag, :id
  json.url menu_to_tag_url(menu_to_tag, format: :json)
end

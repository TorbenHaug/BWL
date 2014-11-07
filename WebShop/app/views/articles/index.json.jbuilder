json.array!(@articles) do |article|
  json.extract! article, :id, :name, :description, :price, :deleted_at
  json.url article_url(article, format: :json)
end

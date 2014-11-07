json.array!(@article_structures) do |article_structure|
  json.extract! article_structure, :id, :amount, :deleted_at
  json.url article_structure_url(article_structure, format: :json)
end

json.array!(@article_to_tags) do |article_to_tag|
  json.extract! article_to_tag, :id
  json.url article_to_tag_url(article_to_tag, format: :json)
end

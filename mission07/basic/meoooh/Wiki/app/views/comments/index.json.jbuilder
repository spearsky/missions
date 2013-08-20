json.array!(@comments) do |comment|
  json.extract! comment, :name, :contents, :topic_id
  json.url comment_url(comment, format: :json)
end

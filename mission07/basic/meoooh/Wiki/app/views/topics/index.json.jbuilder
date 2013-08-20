json.array!(@topics) do |topic|
  json.extract! topic, :name, :contents
  json.url topic_url(topic, format: :json)
end

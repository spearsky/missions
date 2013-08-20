json.array!(@posts) do |post|
  json.extract! post, :title, :text, :user_id, :community_id
  json.url post_url(post, format: :json)
end

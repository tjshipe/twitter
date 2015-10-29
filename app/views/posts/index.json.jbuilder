json.array!(@posts) do |post|
  json.extract! post, :id, :body, :user, :created_at
  json.url post_url(post, format: :json)
end

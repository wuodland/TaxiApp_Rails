json.extract! post, :id, :content, :customer_id, :created_at, :updated_at
json.url post_url(post, format: :json)

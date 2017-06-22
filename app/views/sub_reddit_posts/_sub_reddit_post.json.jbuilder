json.extract! sub_reddit_post, :id, :created_at, :updated_at
json.url sub_reddit_post_url(sub_reddit_post, format: :json)

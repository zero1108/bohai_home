json.extract! news, :id, :title, :content, :state, :created_at, :updated_at
json.url news_url(news, format: :json)

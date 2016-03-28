Sidekiq.configure_server do |config|
  config.redis = { url: Chamber.redis_url  }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Chamber.redis_url }
end

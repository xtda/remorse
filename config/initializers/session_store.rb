if Rails.env == 'development'
  Rails.application.config.session_store :cookie_store, key: '_remorse'
else Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_remorse', domain: :all
end
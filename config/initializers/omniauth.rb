OmniAuth.config.logger = Rails.logger

facebook_key = Rails.application.credentials[:FACEBOOK][:FACEBOOK_KEY]
facebook_secret = Rails.application.credentials[:FACEBOOK][:FACEBOOK_SECRET]
google_key = Rails.application.credentials[:GOOGLE][:GOOGLE_KEY]
google_secret = Rails.application.credentials[:GOOGLE][:GOOGLE_SECRET]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,  facebook_key, facebook_secret
  provider :google_oauth2, google_key, google_secret
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?

  if ENV['GOOGLE_CLIENT_ID'].present?
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  end

  if ENV['FACEBOOK_APP_ID'].present?
    provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  end
end
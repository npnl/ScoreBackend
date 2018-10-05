Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "991076649977-fig76kce6gffee303g2flm4m5s54429a.apps.googleusercontent.com", "lgmhjB6SJTEQBbQwl9-F_jxu"
end
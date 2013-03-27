Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '498568113509294', '8fb2d6a1fc453c35842e62c02761dade'
end

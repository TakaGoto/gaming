Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '405871032842473', '860e9488ebc9aae395e28754c5d177b7'
end

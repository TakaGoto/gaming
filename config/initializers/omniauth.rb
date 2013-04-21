Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '498568113509294', '8fb2d6a1fc453c35842e62c02761dade'
  provider :twitch_oauth2, "oaf6abjgztln932floua3dyxqdm6rf7", "sbbqy6rb8nl4u19fqltoftqvy0w959f"
end

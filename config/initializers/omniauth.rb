Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           '591777256334-841dibubll88njllc7d0s8c656hphp7c.apps.googleusercontent.com',
           'JpRWG5XpyvUNjjSPgJoBNmQq',
           {access_type: 'online', approval_prompt: ''}
end

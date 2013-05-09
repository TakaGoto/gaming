require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'friendly_id'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Gaming
  class Application < Rails::Application
    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.active_support.escape_html_entities_in_json = true

    config.active_record.whitelist_attributes = true

    config.assets.enabled = true

    config.assets.version = '1.0'

    config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => "tak.yuki@gmail.com",
      :password             => "Gototak1!",
      :authentication       => :plain,
      :enable_starttls_auto => true
    }

    config.action_mailer.default_url_options = {
      :host => "gmail.com"
    }
  end
end

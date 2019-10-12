require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BohaiHome
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    I18n.available_locales = [:en, :"zh-CN"]
    config.i18n.default_locale = :"zh-CN"
    config.i18n.load_path += Dir["#{config.root}/config/locals/*.yml"]
    config.autoload_paths += Dir["#{config.root}/app/models/**/","#{config.root}/lib/**/"]
    config.autoload_paths += Dir["#{config.root}/lib/validators"]    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

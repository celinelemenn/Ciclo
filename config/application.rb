require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Ciclo
  class Application < Rails::Application
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.active_job.queue_adapter = :sidekiq
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.autoload_paths << Rails.root.join('lib')
    config.assets.initialize_on_precompile = false

    # config locales
    config.i18n.load_path +=  Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :fr]
    config.i18n.fallbacks = true
    config.middleware.use I18n::JS::Middleware

    # config.force_ssl = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

require_relative "boot"

require "rails/all"

require 'dotenv'
Dotenv.load

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GoalManager
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins ENV["API_DOMAIN"]
        resource '*',
        headers: :any,
        expose: ["access-token", "expiry", "token-type", "uid", "client"],
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end

    config.i18n.default_locale = :ja

    config.generators do |g|
      g.assets          false 
    end 

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

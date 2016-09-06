require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bon
  class Application < Rails::Application

    config.autoload_paths += %w(#{config.root}/app/models/ckeditor #{config.root}/app/models/post #{config.root}/app/models/post_section)
    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w(ckeditor/*)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

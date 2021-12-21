require 'action_controller/railtie'

class App < Rails::Application
  config.eager_load = true
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
  config.secret_key_base = SecureRandom.uuid

  routes.append { root to: 'app#index' }

  # For Glitch:
  config.hosts << '.glitch.me'
  config.action_dispatch.default_headers.delete('X-Frame-Options')
end

class AppController < ActionController::Base
  layout 'application'
  def index; end
end

App.initialize!
run App

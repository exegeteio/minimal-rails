require 'action_controller/railtie'

class App < Rails::Application
  config.eager_load = true
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
  config.secret_key_base = SecureRandom.uuid

  routes.append { root to: 'app#index' }
end

class AppController < ActionController::Base
  layout 'application'
  def index; end
end

App.initialize!
run App
ENV['SINATRA_ENV'] ||= 'development'
# api_key = ENV['MY_SECRET']
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

configure :development do
  set :database, 'sqlite:db/database.db'
end

require './app/controllers/application_controller'
require_all 'app'

# environment is maintained on your system, not germaine to your app. Can be useful for security concerns, like an API key.

require 'sinatra'
require 'aasm'

RAILS_ROOT = '/Users/deploy/Sites/rails_invoice'

require 'active_support'
relative_load_paths = %w(app/models)
::ActiveSupport::Dependencies.load_paths = relative_load_paths.map { |path|
  File.expand_path(path, RAILS_ROOT)
}
require 'active_record'
config_path     = File.expand_path('config/database.yml', RAILS_ROOT)
all_envs_config = YAML.load(File.read(config_path)) 
config          = all_envs_config[ENV['RACK_ENV']]
::ActiveRecord::Base.establish_connection(config)

get '/' do
  @users = User.all
  haml :index
end

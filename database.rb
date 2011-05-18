RAILS_ROOT = '/Users/deploy/code/rails_invoice'

require 'active_support'
relative_load_paths = %w(app/models)
::ActiveSupport::Dependencies.load_paths = relative_load_paths.map { |path|
  File.expand_path(path, RAILS_ROOT)
}
require 'active_record'
require 'yaml'
# Dir.glob(File.join(File.dirname(__FILE__), "#{RAILS_ROOT}/app/models/*.rb")).each {|f| require f }
config_path     = File.expand_path('config/database.yml', RAILS_ROOT)
all_envs_config = YAML.load(File.read(config_path)) 
config          = all_envs_config[ENV['RACK_ENV']]
# puts config.to_yaml
::ActiveRecord::Base.establish_connection(config)
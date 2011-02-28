$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rails_assist'
require 'rails_assist/rspec'
require 'rails-app-spec'
require 'tmpdir'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

require 'generator-spec'
                             
RSpec::Generator.configure do |config|
  config.debug = false
  config.remove_temp_dir = false # true
  config.default_rails_root(__FILE__) 
  config.lib = File.dirname(__FILE__) + '/../lib'
  config.logger = :stdout  
end   

require 'fixtures'

def project_dir
  File.dirname(__FILE__) + '/..'
end

def temp_dir name
  File.join(project_dir, name)  
end

def make_temp_dir name   
  FileUtils.mkdir_p temp_dir(name)
end

def remove_temp_dir name   
  FileUtils.rm_rf temp_dir(name)
end

RailsAssist::Directory.rails_root = temp_dir('tmp_rails')

# puts "Rails root: #{RailsAssist::Directory.rails_root}"

RSpec.configure do |config|
  config.mock_with :mocha
  # config.before do
  #   make_temp_dir 'tmp_rails'
  # end
  # config.after do
  #   remove_temp_dir 'tmp_rails'
  # end
end


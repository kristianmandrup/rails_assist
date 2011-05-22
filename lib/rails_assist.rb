# require 'thor'
require 'require_all'
require 'fileutils'
require 'rake'
require 'active_support/inflector'

require 'sugar-high/alias'
require 'sugar-high/file'
require 'sugar-high/regexp'
require 'sugar-high/array'

require 'rails_assist/namespaces'

module RailsAssist
  def self.artifacts
    [:observer, :controller, :helper, :mailer, :model, :migration, :permit]
  end

  def self.specials type=nil
    case type
    when :config
      [:initializer, :locale]
    when :public
      [:stylesheet, :javascript]
    else
      raise ArgumentError, "Unknown specials type #{type}. Specify :config or :public" if type && type != :all
      [:initializer, :locale] + [:stylesheet, :javascript]
    end
  end
  
  class << self
    attr_accessor :debug_on
  end
end

require 'rails_assist/app'
require 'rails_assist/directory'
require 'rails_assist/file'
require 'rails_assist/files'
require 'rails_assist/artifact'
require 'rails_assist/macro' 

require 'raila_assist/layouts/rails_31' if Rails.version > "3.1"




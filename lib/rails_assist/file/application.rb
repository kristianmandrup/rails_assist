require 'sugar-high/file'

module RailsAssist::File
  module Application
    module Methods
      def insert_application_config statement=nil, &block
        statement = block ? yield : "config.#{statement}"
        application_file.insert statement, :after => 'Rails::Application'
      end  
    end
    include Methods
    extend Methods
  end
end

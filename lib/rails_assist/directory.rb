require_all File.dirname(__FILE__) + '/directory'
require 'rails_assist/artifact'

module RailsAssist
  module Directory      
    class << self
      attr_accessor :rails_root
      
      def method_missing(sym, *args, &block)
        RailsAssist::Artifact::Directory.send sym
      end
    end    

    include Root
    extend Root

    include App
    extend App

    include Container    
    extend Container
        
    # dir_for helpers
    # -------------------

    module Methods   
      DIR = RailsAssist::Artifact::Directory      
      
      # :app, :config, :db, :public, :lib, :log, :doc, :test, :spec
      #
      # app_dir, config_dir ...
      RailsAssist::Directory::Root.root_directories.each do |name|
        class_eval %{
          def #{name}_dir options={}
            _root_dir = RailsAssist::Directory::Root.root_dir(options)
            raise "Rails Root dir not defined" if _root_dir.nil?
            ::File.join(_root_dir, '#{name}')
          end        
        } 
      end      
      
      def rails_dir_for type, options={}
        raise ArgumentError, '#rails_dir_for takes a dir type argument' if !type
        dir_method = "#{type}_dir"
        return send(dir_method, options) if respond_to?(dir_method)
        DIR.send(dir_method, options) if DIR.respond_to?(dir_method)
      end

      def app_dir_for type, options={}
        ::File.join(app_dir(options), type.to_s.pluralize)
      end      

      def config_dir_for type, options={}
        ::File.join(config_dir(options), type.to_s.pluralize)
      end      

      def public_dir_for type, options={}
        ::File.join(public_dir(options), type.to_s.pluralize)
      end                
    end
    
    include Methods
    extend Methods
    
  end # Directories   
end

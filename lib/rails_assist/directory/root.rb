module RailsAssist::Directory
  module Root
    module Methods
      def root_directories
        [:app, :config, :db, :public, :lib, :log, :doc, :test, :spec]      
      end

      def root_dirpath options={}
        raise ArgumentError, "options argument to root_dir must be a hash, was: #{options.inspect}" if options && !options.kind_of?(Hash)
        dir = options[:root_path] if options 
        dir ||= RailsAssist::Directory.rails_root || Rails.root
        raise "You must set the Rails app root dir: RailsAssist::App.root_dir = '/my/root/dir'" if !dir
        dir.to_s.path
      end
      
      def root_dir options={}    
        root_dirpath(options).dir
      end      
    end    
    
    include Methods
    extend Methods
  end
end
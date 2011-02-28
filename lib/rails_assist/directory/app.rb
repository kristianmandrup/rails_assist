module RailsAssist::Directory
  module App  
    module Methods
      def app_directories
        RailsAssist::Artifact::app_artifacts.map {|a| a.to_s.pluralize.to_sym}
      end

      def app_dirpath options={}
        rails_root_dir = RailsAssist::Directory::Root.root_dir(options)
        [rails_root_dir, 'app'].file_join
      end

      def app_dir options={}
        app_dirpath(options).dir
      end
    end
    
    include Methods
    extend Methods
  end
end
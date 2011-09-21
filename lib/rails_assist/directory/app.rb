module RailsAssist::Directory
  module App
    module Methods
      def app_directories
        RailsAssist::Artifact::app_artifacts.map {|a| a.to_s.pluralize.to_sym}
      end

      def app_dirpath options={}
        rails_root_dirpath = RailsAssist::Directory::Root.root_dirpath(options)
        [rails_root_dirpath, 'app'].file_join
      end

      def app_dir options={}
        app_dirpath(options).dir
      end
    end

    include Methods
    extend Methods
  end
end

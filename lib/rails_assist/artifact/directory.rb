module RailsAssist::Artifact
  module Directory
    module Methods
      DIR = RailsAssist::Directory
      APP_DIR = RailsAssist::Directory::App
      
      # :controller, :mailer, :helper, :view, :model, :permit
      #
      # controller_dir, mailer_dir ...
      RailsAssist::Artifact.app_artifacts.each do |name|
        class_eval %{
          def #{name}_dirpath options={}
            [APP_DIR.app_dirpath(options), '#{name.to_s.pluralize}'].file_join
          end

          def #{name}_dir options={}
            #{name}_dirpath(options).dir
          end
        } 
      end    
        
      # initializer_dir, locale_dir
      # stylesheet_dir, javascript_dir    
      {:config => RailsAssist.specials(:config), :public => RailsAssist.specials(:public)}.each_pair do |container, names|
        names.each do |name|
          class_eval %{      
            def #{name}_dirpath options={}
              RailsAssist::Directory.#{container}_dir_for(:#{name.to_s.pluralize}, options).path
            end  

            def #{name}_dir options={}
              #{name}_dirpath(options).dir
            end
          }
        end
      end
      
      def migration_dirpath options={}
        [DIR.db_dir(options), 'migrations'].file_join
      end

      def migration_dir options={}
        migration_dirpath(options).dir
      end
      
      def observer_dirpath options={}
        model_dir(options).path
      end

      def observer_dir options={}
        observer_dirpath(options).dir
      end
    end

    extend Methods
    include Methods
  end
end

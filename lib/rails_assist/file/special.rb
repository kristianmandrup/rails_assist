require_all File.dirname(__FILE__)

module RailsAssist::File
  module Special          
    module Methods
      # application_file, environment_file
      [:application, :environment, :routes, :boot].each do |name|
        class_eval %{
          def #{name}_filepath
            [RailsAssist::Directory.config_dir.path, '#{name}.rb'].file_join
          end

          def #{name}_file
            #{name}_filepath.new_file
          end
        }
      end  

      def database_filepath
        [RailsAssist::Directory.config_dir.path, 'database.yml'].file_join
      end

      def database_file
        raise "No Database file found at #{database_filepath}" if File.file? database_filepath
        File.new(database_filepath) 
      end

      def seed_filepath
        [RailsAssist::Directory.db_dir.path, 'seeds.rb'].file_join
      end

      def seed_file
        raise "No Seed file found at #{seed_filepath}" if !File.exist? seed_filepath
        seed_filepath.new_file
      end
          
      # read_application_file
      # append_to_application_file
      [:application, :environment, :seed, :gem, :routes, :boot, :database].each do |name|
        class_eval %{      
          def read_#{name}_file
            #{name}_file.read_content
          end

          def remove_#{name}_file
            #{name}_file.delete!
          end

          def append_to_#{name}_file content=nil, &block
            #{name}_file.append content, &block
          end

          def replace_in_#{name}_file options = {}, &block
            #{name}_file.replace_content options, &block
          end

          def remove_from_#{name}_file content=nil, &block
            #{name}_file.remove_content content, &block
          end
        }
      end
    end
    
    include Methods
    extend Methods
    
    include RailsAssist::File::Application
    include RailsAssist::File::Environment
    include RailsAssist::File::Gemfile
    include RailsAssist::File::Routes    

    extend RailsAssist::File::Application
    extend RailsAssist::File::Environment
    extend RailsAssist::File::Gemfile
    extend RailsAssist::File::Routes    

  end
end

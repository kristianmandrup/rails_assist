require 'rake'
require 'rails_assist/directory'
require 'sugar-high/regexp'

require_all File.dirname(__FILE__) + '/file'

module RailsAssist
  module Files
    # we depend on the Directories module doing some of the hard work!
    module Methods
      RYBY_FILES = '**/*.rb'

      def rails_app_filepaths type = :app, options = {}
        type = (type =~ /ss/) ? type : type.to_s.singularize
        dir = RailsAssist::Directory.send "#{type}_dirpath"
        expr = options[:expr]
        file_pattern = options[:pattern] || RYBY_FILES
        pattern = "#{dir}/#{file_pattern}"
        FileList[pattern].to_a.grep_it expr
      end

      def rails_app_files type = :app, options = {}
        rails_app_filepaths(type, options).to_files
      end

      def all_filepaths expr=nil
        pattern = "#{RailsAssist::Directory::Root.root_dirpath}/**/*.*"
        FileList[pattern].to_a.grep_it expr
      end

      def all_files expr=nil
        all_filepaths(expr).to_files
      end

      def app_filepaths expr=nil
        rails_app_files(:app).grep_it expr
      end

      def app_files expr=nil
        app_filepaths(expr).to_files
      end

      # files_from :model, :controller, :matching => /user/
      def filepaths_from *types, &block
        expr = last_option(types)[:matching]
        the_files = types.inject([])  do |files, type|
          method = :"#{type}_files"
          files_found = send(method, expr) if respond_to?(method)
          files_found = RailsAssist::Artifact::Files.send(method, expr) if RailsAssist::Artifact::Files.respond_to?(method)
          files + files_found
        end.compact
        yield the_files if block
        the_files
      end

      def files_from *types, &block
        filepaths_from(*types, &block).to_files
      end

      def with_filepaths_from type, expr=nil, &block
        method = "#{type}_files"
        send method, expr, &block if respond_to?(method)
      end

      def with_files_from type, expr=nil, &block
        with_filepaths_from(type, expr=nil, &block).to_files
      end

      [:initializer, :db, :migration].each do |name|
        class_eval %{
          def #{name}_filepaths expr=nil
            filepaths = rails_app_files(:#{name}, :expr => expr)
            yield filepaths if block_given?
            filepaths
          end

          def #{name}_files expr=nil
            files = #{name}_filepaths(expr).to_files
            yield files if block_given?
            files
          end
        }
      end

      {:config => :yml, :locale => :yml, :javascript => :js, :coffee => :coffee}.each_pair do |name, ext|
        class_eval %{
          def #{name}_filepaths expr=nil
            filepaths = rails_app_files(:#{name}, :pattern => '**/*.#{ext}', :expr => expr)
            yield filepaths if block_given?
            filepaths
          end

          def #{name}_files expr=nil
            files = #{name}_filepaths(expr).to_files
            yield files if block_given?
            files
          end
        }
      end

      {:css => :css, :sass => :scss}.each_pair do |name, ext|
        class_eval %{
          def #{name}_filepaths expr=nil
            filepaths = rails_app_files(:stylesheets, :pattern => '**/*.#{ext}', :expr => expr)
            yield filepaths if block_given?
            filepaths
          end

          def #{name}_files expr=nil
            files = #{name}_filepaths(expr).to_files
            yield files if block_given?
            files
          end
        }
      end

      RailsAssist::Artifact.app_artifacts.each do |name|
        plural_name = name.to_s.pluralize
        class_eval %{
          def #{name}_files? *names
            names.to_strings.each do |name|
              return false if !#{name}_file?(name)
            end
            true
          end

          def #{name}_file? name
            ::File.file? #{name}_file(name)
          end
          alias_method :has_#{name}_file?, :#{name}_file?

          def remove_all_#{plural_name}
            RailsAssist::Artifact::Files.#{name}_files.each{|f| ::File.delete_file! f}
          end
          alias_method :delete_all_#{plural_name}, :remove_all_#{plural_name}

          def remove_#{plural_name} *names
            return remove_all_#{plural_name} if names.empty?
            names.to_strings.each do |name|
              ::File.delete #{name}_file(name)
            end
          end
          alias_method :delete_#{plural_name}, :remove_#{plural_name}
          alias_method :remove_#{name}, :remove_#{plural_name}
          alias_method :delete_#{name}, :remove_#{plural_name}
        } 
      end
    end

    include Methods
    extend Methods
  end # Files
end # App

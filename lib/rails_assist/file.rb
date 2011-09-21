require_all File.dirname(__FILE__) + '/file'

module RailsAssist
  module File
    module Methods
      {:initializer => 'rb', :db => 'rb', :migration => 'rb', :locale => 'yml', :coffee => 'coffee', :javascript => 'js', :stylesheet => 'css', :config => '.rb', :db => '.rb'}.each_pair do |name, ext|
        plural_name = name.to_s.pluralize
        pure_ext = ext.gsub /^\./, ''
        class_eval %{
          def #{name}_file? name
            name = name.as_filename
            name = (name =~ /.rb$/) ? name : "\#{name}.#{pure_ext}"
            #{name}_file(name)
          end
          alias_method :has_#{name}_file?, :#{name}_file?

          def #{name}_files? *names
            names.to_filenames.each do |name|
              return false if !#{name}_file?(name)
            end
            true
          end

          def #{name}_filepath name
            name = name.as_filename
            name = (name =~ /.rb$/) ? name : "\#{name}.#{pure_ext}"
            [RailsAssist::Artifact::Directory.#{name}_dirpath, name].file_join
          end

          def #{name}_file name
            name = name.as_filename
            #{name}_filepath(name).new_file
          end

          def create_#{name} name, &block
            name = name.as_filename

            # create dir for artifact if it doesn't exist
            RailsAssist::App.create_empty_tmp :#{name} if !RailsAssist::Artifact::Directory.#{name}_dir

            #{name}_file(name).overwrite do
              yield
            end
          end

          def read_#{name} name
            name = name.as_filename
            #{name}_file(name).read_content
          end
          alias_method :read_#{name}_file, :read_#{name}

          def replace_#{name}_content name, args = {}, &block
            name = name.as_filename
            if !(args.kind_of?(Hash) && args[:where])
              raise ArgumentError, "#replace_#{name}_content Must take a hash argument with a :where option that is the content to be matched and replaced" 
            end

            replace_content = block ? yield : args[:with]
            if !replace_content
              raise ArgumentError, "#replace_#{name}_content Must take a block or a :with hash option that is the content to replace with" 
            end

            #{name}_file(name).replace_content :where => args[:where], :with => replace_content
          end

          def remove_all_#{plural_name}
            return if !(RailsAssist::Artifact::Directory.#{name}_dir.path.directory?) # bug?
            #{name}_files.delete_all!
          end

          def remove_#{plural_name} *names
            return remove_all_#{plural_name} if names.empty?
            names.to_filenames.each do |name|
              name = (name =~ /.rb$/) ? name : "\#{name}.#{pure_ext}"
              #{name}_file(name).delete!
            end
          end
          alias_method :remove_#{name}, :remove_#{plural_name}
        }
      end
    end

    include Special
    extend Special

    include Methods
    extend Methods
  end
end


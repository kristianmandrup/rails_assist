module RailsAssist::File
  module Gemfile
    def has_gem? name
      read_gem_file =~ /gem\s+('|")#{name}\1/
    end

    def has_gem_version? name, version = nil
      read_gem_file =~ /gem\s+('|")#{name}\1,\s*('|")#{version}\2/
    end

    def clean_gemfile
      clean_gemfile_content = read_gem_file.gsub(/('|"|end)\s*gem/m, "\\1\ngem")
    end

    def gem_filepath
      [RailsAssist::Directory::Root.root_dirpath, 'Gemfile'].file_join
    end
    
    def gem_file
      raise "No Gemfile found at #{gem_filepath}" if !File.exist? gem_filepath
      gem_filepath.new_file
    end

    # def with_gem_file command = nil
    #   return send :"#{command}_gem_file" if command.valid_file_command?
    # 
    #   raise "No Gemfile found at #{gem_filepath}" if gem_filepath.exists?
    #   gem_filepath.new_file
    # end
  end
end

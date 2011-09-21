module RailsAssist
  module App
    def create_empty_tmp *dir_types
      dir_types.flatten.each do |dir_type|
        dir = RailsAssist::Directory.rails_dir_for(dir_type)
        FileUtils.mkdir_p dir
      end
    end

    extend self
  end
end


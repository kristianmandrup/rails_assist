module RailsAssist::Artifact
  module Methods
    def helper_list
      RailsAssist.artifacts + [:view]
    end

    def app_artifacts
      [:controller, :mailer, :helper, :view, :model, :permit, :license, :validator]
    end

    def rails_artifacts
      @rails_artifacts ||= begin
        files_methods = RailsAssist::Artifact::Files.instance_methods
        files_symbols = files_methods.grep(/_files$/).map{|f| f.to_s.gsub(/^(.*)_files/, '\1').to_sym }

        # dir_methods = RailsAssist::Artifact::Directory.instance_methods
        # dir_symbols = dir_methods.map{|dir| dir.to_s.gsub(/^(.*)_dir/, '\1').to_sym }
        dir_symbols = []

        (files_symbols + dir_symbols).uniq
      end
    end

    def valid_artifact? type
      rails_artifacts.include?(type)
    end
  end

  extend Methods
  include Methods
end


require_all File.dirname(__FILE__) + '/artifact'

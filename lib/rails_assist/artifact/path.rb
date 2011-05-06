module RailsAssist::Artifact
  module Path
    include RailsAssist::Artifact::Directory    
    
    def artifact_path name, type, options={}
      dir = send :"#{type}_dirpath", options
      File.join(dir, "#{name}#{type_postfix type}.rb")
    end

    protected

    def type_postfix type
      "_#{type}" if ![:model].include?(type)
    end
  end
end
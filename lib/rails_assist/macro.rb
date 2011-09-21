module RailsAssist
  module UseMacro
    def use_orm orm
      class_eval do
        begin
          include "RailsAssist::Orm::#{orm.to_s.camelize}".constantize
        rescue
          raise ArgumentError, "Unregistered ORM library: #{orm}"
        end
      end
    end

    def default_template_lang lang
      class_eval do
        begin
          include "RailsAssist::TemplateLanguage::#{lang.to_s.camelize}".constantize
        rescue
          raise ArgumentError, "Unregistered Template Language: #{lang}"
        end
      end
    end

    def assist_with *types
      types.each{|type| use_helper type}
    end
    alias_method :load_helpers, :assist_with
    alias_method :use_helpers,  :assist_with

    def rails_assist type
      class_eval do
        begin
          module_name = "RailsAssist::#{type.to_s.camelize}"
          include module_name.constantize
          if [:files, :directory].include? type
            module_name = "RailsAssist::Artifact::#{type.to_s.camelize}"
            include module_name.constantize
          end
        rescue
          raise ArgumentError, "Unregistered RailsAssist library: #{type}, #{module_name}"
        end
      end
    end

    def artifact_assist type
      class_eval do
        begin
          module_name = "RailsAssist::Artifact::#{type.to_s.camelize}"
          include module_name.constantize
        rescue
          raise ArgumentError, "Unregistered RailsAssist Artifact library: #{type}, #{module_name}"
        end
      end
    end

    def use_helper type
      if type == :special
        class_eval do
          include "RailsAssist::File::Special".constantize
        end
        return
      end

      return rails_assist(type) if [:file, :files, :directory, :app].include?(type)
      artifact_assist(type)
    end
    alias_method :load_helper, :use_helper
  end
end

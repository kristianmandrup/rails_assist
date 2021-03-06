require 'sugar-high/regexp'

module RailsAssist::Artifact
  module Files
    module Methods
      [:model].each do |name|
        class_eval %{
          def #{name}_filepaths expr=nil
            files = RailsAssist::Files.rails_app_files(:#{name.to_s.pluralize}).grep_it expr
            yield files if block_given?
            files
          end

          def #{name}_files expr=nil
            files = #{name}_filepaths(expr).to_files
            yield files if block_given?
            files
          end
        }
      end

      [:initializer, :locale, :config].each do |name|
        class_eval %{
          def #{name}_filepaths expr=nil
            files = RailsAssist::Files.rails_app_files(:#{name.to_s.pluralize}).grep_it expr
            yield files if block_given?
            files
          end
        }
      end

      # artifact files using xxx_[artifact].rb convention, i.e postfixing with type of artifact
      [:mailer, :observer, :permit, :license, :controller, :helper, :validator].each do |name|
        class_eval %{
          def #{name}_filepaths expr=nil
            files = RailsAssist::Files.rails_app_files(:#{name.to_s.pluralize}, :pattern => '**/*_#{name}.rb').grep_it expr
            yield files if block_given?
            files
          end

          def #{name}_files expr=nil
            files = #{name}_filepaths(expr).to_files
            yield files if block_given?
            files
          end
        }
      end

      def view_filepaths *args
        expr, name = Helper.get_view_args args
        ext = last_option(args)[:template_language] || 'erb'
        pattern = name ? "#{name.to_s.pluralize}/*.#{ext}*" : "**/*.#{ext}*"
        files = RailsAssist::Files.rails_app_files(:views, :pattern => pattern).grep_it expr
        yield files if block_given?
        files
      end

      def view_files *args
        files = view_filepaths(args).to_files
        yield files if block_given?
        files
      end

      def asset_filepaths *args
        expr, name = Helper.get_asset_args args
        ext = last_option(args)[:ext]
        pattern = name ? "#{name.to_s.pluralize}/*.#{ext}*" : "**/*.#{ext}*"
        files = RailsAssist::Files.rails_app_files(:assets, :pattern => pattern).grep_it expr
        yield files if block_given?
        files
      end

      def asset_files *args
        files = asset_filepaths(args).to_files
        yield files if block_given?
        files
      end

      [:js, :css, :scss, :sass].each do |name|
        class_eval %{
          def #{name}_asset_filepaths *args
            asset_files args, :ext => :#{name}
          end

          def #{name}_asset_files *args
            asset_filepaths(args).to_files
          end
        }
      end

      [:erb, :haml, :slim].each do |name|
        class_eval %{
          def #{name}_view_filepaths *args
            view_files args, :template_language => :#{name}
          end

          def #{name}_view_files *args
            view_filepaths(args).to_files
          end
        }
      end
    end
    extend Methods
    include Methods

    module Helper
      class << self
        def get_view_args args
          args = args.flatten
          first_arg = args.first
          case first_arg
          when Regexp
            expr = first_arg
          when String, Symbol
            _model = first_arg
          end
          expr = args[1] if args.size > 1 && args[1].kind_of?(Regexp)
          [expr, _model]
        end
        alias_method :get_asset_args, :get_view_args
      end
    end
  end
end

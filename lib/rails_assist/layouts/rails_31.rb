# In Rails 3.1+ the assets such as: javascript, coffeescript and stylesheets are stored in the app/asset directory 
module RailsAssist::Artifact
  module Directory
    module Methods  
      [:stylesheet, :javascript, :coffeescript].each do |name|
        class_eval %{      
          def #{name}_dirpath options={}
            RailsAssist::Directory.app_asset_dir_for(:#{name.to_s.pluralize}, options).path
          end
        }
      end      
    end
  end
end

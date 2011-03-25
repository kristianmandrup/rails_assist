require 'sugar-high/module'

module RailsAssist
  modules :app, :directory, :files, :file
  modules :artifact do
    nested_modules :directory, :files, :path
  end
end
    

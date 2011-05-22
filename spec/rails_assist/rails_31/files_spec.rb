require 'rails_31_spec_helper'

CLASS = RailsAssist::Files

class AppDir
  extend RailsAssist::UseMacro
  use_helper :files
end

describe RailsAssist::Files do
  # use_helper :directories

  before do
    RailsAssist::Directory.rails_root = fixtures_dir
  end

  describe '#css_files' do
    it "should return files for css directory" do    
      CLASS.css_files.file_names.should include('scaffold.css')
    end  
  end
end
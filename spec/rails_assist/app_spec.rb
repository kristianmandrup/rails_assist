require 'spec_helper'

CLASS = RailsAssist::App

class Helper
  include RailsAssist::App
  include RailsAssist::Directory
  include RailsAssist::Artifact
end

describe 'controller' do
  before do                                         
    RailsAssist::Directory.rails_root = fixtures_dir
    @helper = Helper.new
  end

  after do
    remove_temp_dir 'tmp_rails'
  end
    
  it "should create basic root directories" do
    CLASS.create_empty_tmp @helper.root_directories    
    @helper.root_dir.path.should have_dirs(@helper.root_directories)
  end
                           
  # TODO: have_dirs should also work on Directory object!
  it "should have basic app directories" do
    @helper.create_empty_tmp @helper.app_artifacts
    @helper.app_dir.path.should have_dirs(@helper.app_directories)
  end
end
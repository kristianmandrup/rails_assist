require 'rails_31_spec_helper'

CLASS = RailsAssist::File

class AppDir
  extend RailsAssist::UseMacro
  use_helper :file
end

describe RailsAssist::File do
  # use_helper :directories

  let (:name) { 'backbone' }

  before do
    RailsAssist::Directory.rails_root = fixtures_dir
  end

  before :each do
    CLASS.remove_asset(:coffee, name)    
  end

  describe '#asset_filepath' do
    it "should return the asset file 'mime_types' " do
      AppDir.new.asset_filepath(name).should match /mime_type/
    end
  end    

  describe '#asset_file' do
    it "should return the asset file" do
      AppDir.new.asset_file(:coffee, name).path.should match /mime_type/
    end
  end    

  describe '#create_asset' do
    it "should create the asset file 'backbone' " do
      CLASS.create_asset(:coffee, name) do
        'hello'
      end
      CLASS.asset_file(:coffee, name).path.should match /#{name}/
      CLASS.read_asset(:coffee, name).should match /hello/
    end
  end    

  describe '#read_asset' do
    it "should create replace asset content using hash args" do      
      CLASS.create_asset(:coffee, name) do
        'hello'
      end      
      CLASS.read_asset(:coffee, name).should match /hello/
      CLASS.remove_asset(:coffee, name)      
    end
  end
  
  describe '#replace_asset_content' do
    it "should create replace asset content using hash args" do      
      CLASS.create_asset(:coffee, name) do
        'hello'
      end
      CLASS.replace_asset_content :coffee, name, :where => 'hello', :with => 'goodbye'
      
      CLASS.read_asset(:coffee, name).should match /goodbye/
      CLASS.read_asset(:coffee, name).should_not match /hello/
    end
  end
  
  describe '#remove_assets' do
    it "should remove the asset files named 'backbone' " do
      CLASS.create_asset(:coffee, name) do
        'hello'
      end

      CLASS.read_asset(:coffee, name).should match /hello/
      CLASS.remove_asset(:coffee, name)
      CLASS.read_asset(:coffee, name).should be_empty
    end
  end
end  

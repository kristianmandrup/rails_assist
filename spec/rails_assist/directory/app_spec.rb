require 'spec_helper'

CLASS = RailsAssist::Directory::App

class AppDir
  include CLASS
end

def rails_root
  RailsAssist::Directory.rails_root
end

describe RailsAssist::Directory::App do
  # use_helper :directories

  before do
    RailsAssist::Directory.rails_root = fixtures_dir
  end

  describe '#self.app_directories' do
    it "should return symbols list of Rails 3 app directories" do
      CLASS.app_directories.should include :controllers, :mailers, :helpers, :views, :models, :permits
    end
  end

  describe '#app_directories' do
    it "should return symbols list of Rails 3 app directories" do
      AppDir.new.app_directories.should include :controllers, :mailers, :helpers, :views, :models, :permits
    end
  end


  describe '#self.app_dir' do
    it "should the current Rails 3 ap dir when Rails root is set" do
      CLASS.app_dir.path.should == File.join(rails_root, 'app')
    end
  end

  describe '#app_dir' do
    it "should the current Rails 3 ap dir when Rails root is set" do
      AppDir.new.app_dir.path.should == File.join(rails_root, 'app')
    end
  end
end


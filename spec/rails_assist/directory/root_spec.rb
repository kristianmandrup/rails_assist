require 'spec_helper'

CLASS = RailsAssist::Directory::Root

class RootDir
  include CLASS
end

def rails_root
  RailsAssist::Directory.rails_root
end


describe RailsAssist::Directory::Root do
  # use_helper :directories

  before do
    RailsAssist::Directory.rails_root = fixtures_dir
  end

  describe '#self.root_directories' do
    it "should return symbols list of Rails 3 root directories" do
      CLASS.root_directories.should include :app, :config, :db
    end
  end

  describe '#root_directories' do
    it "should return symbols list of Rails 3 root directories" do
      RootDir.new.root_directories.should include :app, :config, :db
    end
  end


  describe '#self.root_dir' do
    it "should the current Rails 3 ap dir when Rails root is set" do
      CLASS.root_dir.path.should == rails_root
    end
  end

  describe '#self.root_dirpath' do
    it "should the current Rails 3 ap dir when Rails root is set" do
      CLASS.root_dirpath.should == rails_root
    end
  end

  describe '#root_dir' do
    it "should the current Rails 3 ap dir when Rails root is set" do
      RootDir.new.root_dir.path.should == rails_root
    end
  end
end

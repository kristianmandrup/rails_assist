require 'spec_helper'

CLASS = RailsAssist::Directory

class RailsDir
  extend RailsAssist::UseMacro
  use_helper :directory
end

def rails_root
  RailsAssist::Directory.rails_root
end

describe RailsAssist::Directory do
  # use_helper :directories

  before do
    RailsAssist::Directory.rails_root = fixtures_dir
    @test = RailsDir.new
  end

  RailsAssist::Directory::Root.root_directories.each do |name|
    eval %{
      describe '##{name}_dir' do
        it "should return #{name} directory name" do
          CLASS.#{name}_dir.path.should match /\/\#{name}/
          CLASS.#{name}_dir.path.should match Regexp.escape(RailsAssist::Directory.rails_root)
          @test.#{name}_dir.path.should match /\/\#{name}/
        end
      end
    } 
  end
    
  describe '#rails_dir_for' do
    it "should return mailer directory name" do
      @test.rails_dir_for(:mailer).path.should == File.join(rails_root, 'app', 'mailers')
    end
  end

  describe '#rails_dir_for' do
    it "should return app directory name" do
      @test.rails_dir_for(:app).path.should == File.join(rails_root, 'app')
    end
  end

  describe '#config_dir_for' do
    it "should return initializers directory name" do
      @test.config_dir_for(:initializer).path.should == File.join(rails_root, 'config', 'initializers')
    end
  end
  
  describe '#self.config_dir_for' do
    it "should return initializers directory name" do
      CLASS.config_dir_for(:initializer).path.should == File.join(rails_root, 'config', 'initializers')
    end
  end

  describe '#public_dir_for' do
    it "should return javascripts directory name" do
      @test.public_dir_for(:javascript).path.should == File.join(rails_root, 'public', 'javascripts')
    end
  end
end


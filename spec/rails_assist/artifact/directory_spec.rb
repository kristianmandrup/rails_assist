require 'spec_helper'

CLASS = RailsAssist::Artifact::Directory

class ArtDir
  include CLASS
end

describe RailsAssist::Artifact::Directory do
  # use_helper :directories

  before do
    @test = ArtDir.new
  end

  RailsAssist::Artifact.app_artifacts.each do |name|
    eval %{
      describe '##{name}_dir' do
        it "should return #{name} directory name" do
          CLASS.#{name}_dir.path.should match /app\/\#{name}/
          @test.#{name}_dir.path.should match /app\/\#{name}/
        end
      end
    } 
  end

  describe '#observer_dir' do
    it "should return observer directory name" do
      CLASS.observer_dir.path.should match /app\/models/
      @test.observer_dirpath.should match /app\/models/
    end
  end
  
  describe '#migration_dir' do
    it "should return migration directory name" do
      CLASS.migration_dir.path.should match /db\/migration/
      @test.migration_dirpath.should match /db\/migration/
    end
  end
  
  
    
  [:initializer, :locale].each do |name|
    eval %{
      describe '##{name}_dir' do
        it "should return #{name} directory name" do
          CLASS.#{name}_dir.path.should match /config\/\#{name}/
          @test.#{name}_dirpath.should match /config\/\#{name}/
        end
      end
    } 
  end
  
  [:stylesheet, :javascript].each do |name|
    eval %{
      describe '##{name}_dir' do
        it "should return #{name} directory name" do
          CLASS.#{name}_dir.path.should match /public\/\#{name}/
          @test.#{name}_dirpath.should match /public\/\#{name}/
        end
      end
    } 
  end

end

require 'rails_31_spec_helper'
require 'dir_spec_helper'

CLASS = RailsAssist::Artifact::Directory

class ArtDir
  include CLASS
end

describe RailsAssist::Artifact::Directory do
  # use_helper :directories

  before do  
    RailsAssist::Directory.rails_root = fixtures_dir    
    @test = ArtDir.new
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
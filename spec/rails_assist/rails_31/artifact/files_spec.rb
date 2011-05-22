require 'rails_31_spec_helper'

CLASS = RailsAssist::Artifact::Files

class ArtDir
  extend RailsAssist::UseMacro
  use_helper :files  
end

describe RailsAssist::Artifact::Files do
  extend RailsAssist::UseMacro

  use_helpers :directory

  before do
    RailsAssist::Directory.rails_root = fixtures_dir
    @test = ArtDir.new
  end

  describe '#asset_files :javascript' do 
    it "should return :asset files" do
      @test.asset_files(:javascript).file_names.should include('backbone.js', 'underscore.js')
    end
  end   

  describe '#asset_files :coffeescript' do 
    it "should return :asset files" do
      @test.asset_files(:coffeescript).file_names.should include 'app.js.coffeescript'
    end
  end
end
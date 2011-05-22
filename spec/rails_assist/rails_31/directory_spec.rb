require 'rails_31_spec_helper'

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

  describe '#asset_dir_for' do
    it "should get javascript asset directory" do
      @test.asset_dir_for(:javascript).path.should == File.join(rails_root, 'app', 'assets', 'javascripts')
    end

    it "should get coffeescript asset directory" do
      @test.asset_dir_for(:coffeescript).path.should == File.join(rails_root, 'app', 'assets', 'coffeescripts')
    end

    it "should get scss asset directory" do
      @test.asset_dir_for(:scss).path.should == File.join(rails_root, 'app', 'assets', 'coffeescripts')
    end
  end
end
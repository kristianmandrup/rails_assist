require 'spec_helper'

CLASS = RailsAssist::Artifact::Path

class ArtDir
  include CLASS
end

describe RailsAssist::Artifact::Path do
  # use_helper :directories

  before do
    RailsAssist::Directory.rails_root = File.dirname (__FILE__)
    @test = ArtDir.new
  end

  describe '#artifact_path' do
    it "should return mailer directory name" do
      @test.artifact_path(:my_mailer, :mailer)
    end
  end
end


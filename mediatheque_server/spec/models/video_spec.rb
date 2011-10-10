require 'spec_helper'

describe Video do

  before :each do 
    @attr = { 
      :title => "Alien", 
      :path => "/home/enrique-arias/Videos", 
      :file => "alien(1979).avi", 
      :year => "1979", 
      :file_type => Video.to_s,
      :description => "When commercial towing vehicle Nostromo, heading back to Earth, intercepts an SoS signal from a nearby planet, the crew are under obligation to investigate. After a bad landing on the planet, some crew members leave the ship to explore the area. At the same time as they discover a hive colony of some unknown creature, the ship's computer deciphers the message to be a warning, not a call for help. When one of the eggs is disturbed, the crew do not know the danger they are in until it is too late.",
      :duration => 5000,
      :director => "Ridley Scott",
      :writer => "Dan O'Bannon",
      :cast => "Sigourney Weaver, John Hurt, Yaphet Kotto, Tom Skerritt, Veronica Cartwright, Harry Dean Stanton, Ian Holm",
      :composer => "Jerry Goldsmith"
    }
  end

  it "should create an new instance given valid attributes" do
    Video.create! @attr
  end

  it "should require a title" do
    video = Video.new @attr.merge(:title => "")
    video.should_not be_valid
  end

  it "should require a path" do
    video = Video.new @attr.merge(:path => "")
    video.should_not be_valid
  end

  it "should require a file" do
    video = Video.new @attr.merge(:file => "")
    video.should_not be_valid
  end

  it "should require a file_type" do
    video = Video.new @attr.merge(:file_type => "")
    video.should_not be_valid
  end

  it "should not require a description" do
    video = Video.new @attr.merge(:description => "")
    video.should be_valid
  end

  it "should not require a year" do
    video = Video.new @attr.merge(:year => "")
    video.should be_valid
  end

  it "should require a duration" do
    video = Video.new @attr.merge(:duration => "")
    video.should_not be_valid
  end

  it "should not require a writer" do
    video = Video.new @attr.merge(:writer => "")
    video.should be_valid
  end

  it "should not require a director" do
    video = Video.new @attr.merge(:director => "")
    video.should be_valid
  end

  it "should not require a composer" do
    video = Video.new @attr.merge(:composer => "")
    video.should be_valid
  end

  it "should not require a cast" do
    video = Video.new @attr.merge(:cast => "")
    video.should be_valid
  end
end

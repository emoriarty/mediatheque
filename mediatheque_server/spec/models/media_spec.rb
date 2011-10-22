require 'spec_helper'

include MultiMedia

describe Media do

  before :each do 
    @attr = { 
      :title => "Alien", 
      :path => "/home/enrique-arias/Videos", 
      :file_type => "alien(1979).avi", 
      :file => "alien(1979).avi",
      :year => "1979", 
      :description => "When commercial towing vehicle Nostromo, heading back to Earth, intercepts an SoS signal from a nearby planet, the crew are under obligation to investigate. After a bad landing on the planet, some crew members leave the ship to explore the area. At the same time as they discover a hive colony of some unknown creature, the ship's computer deciphers the message to be a warning, not a call for help. When one of the eggs is disturbed, the crew do not know the danger they are in until it is too late."
    }
  end

  it "should create an new instance given valid attributes" do
    Media.create! @attr
  end

  it "should require a title" do
    media = Media.new @attr.merge(:title => "")
    media.should_not be_valid
  end

  it "should require a path" do
    media = Media.new @attr.merge(:path => "")
    media.should_not be_valid
  end

  it "should require a file" do
    media = Media.new @attr.merge(:file => "")
    media.should_not be_valid
  end

  it "should require a file_type" do
    media = Media.new @attr.merge(:file_type => "")
    media.should_not be_valid
  end

  it "should not require a description" do
    media = Media.new @attr.merge(:description => "")
    media.should be_valid
  end

  it "should not require a year" do
    media = Media.new @attr.merge(:year => "")
    media.should be_valid
  end

end

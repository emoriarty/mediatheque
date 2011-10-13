require 'spec_helper'

include MultiMedia

describe Video do
  include_context "shared video object"

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

#  context "with title and file_type duplicated in BBDD should not be created " do
#    before do
#      puts @attr
#      Video.create! @attr
#    end
#    it { should_not accept_values_for(:title, "Alien") }
#  end

end

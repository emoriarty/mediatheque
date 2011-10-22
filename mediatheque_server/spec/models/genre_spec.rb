require 'spec_helper'

include MultiMedia

describe Genre do
  before :each do 
    @attr = { :name => "Sci-fi", :media_type => Video.new.class.name }
  end
  
  it "should create a new instance with valid attributes" do
    Genre.create! @attr
  end
  
  it "should not be valid an instance with no name" do
    genre = Genre.new @attr.merge(:name => "")
    genre.should_not be_valid
  end
  
  it "should not be valid an instance with no media_type" do
    genre = Genre.new @attr.merge(:media_type => "")
    genre.should_not be_valid
  end
  
  context "with media_type duplicated in BBDD" do
    before :each do
      Genre.create! @attr
      @genre = Genre.create @attr
    end
    
    it "should return the message 'name has already been taken'" do
      @genre.errors.messages[:name].include?("has already been taken").should be_true
    end
  end
  
  context "has associated videos" do
    it "should associate an array of Video objects" do
      genre = Genre.new @attr
      arr = []
      5.times{ |i| arr << Video.new  }
      genre.videos = arr
      genre.videos.should == arr
    end
  end
end
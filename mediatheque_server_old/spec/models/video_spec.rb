require 'spec_helper'
require 'movie_searcher'

include MultiMedia

describe Video do
  include_context "shared video attributes"

  context "checking attributes" do
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
      video = Video.new @attr.merge(:plot => "")
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
  
  context "with duplicated values in database" do
    before :each do
      Video.create! @attr
    end
    # it "should return the message 'title has already been taken'" do
    #   @video.errors.messages[:title].include?("has already been taken").should be_true
    # end
    # 
    it "should raise an error" do
      Video.create!(@attr).should raise_error
    end
  end
  
  context "with genres as tags" do
    before :each do
      @video = Video.create @attr
    end
    
    it "should accept a tags string" do
      @video = Video.create @attr
      @video.genre_list = "Sci-fi, Terror, 70's"
      @video.genre_list.should == ["Sci-fi", "Terror", "70's"]
    end
    
    it "should include the just created video with a concrete tag" do
      @video.genre_list = "Sci-fi"
      @video.save
      Video.tagged_with("Sci-fi").include?(@video).should be_true
    end
  end

  context "calling to IMDB service" do
    before :each do
      @video = Video.create @attr
      @movies = @video.retrieve_info
    end
    
    it "should get return an Array" do
      @movies.class.should == Array
    end
    
    it "should modify info from the selected Movie object" do
      @video.update_info(@movies[0]).should be_true
    end
  end
end

require 'spec_helper'

include MultiMedia

describe MultiMediaController do
  describe "POST index.json returns code 200" do
    it "has a 200 status code" do
      post :index, :format => :json
      response.code.should eq("200")
    end
  end

  describe "POST index.xml returns code 200" do
    it "has a 200 status code" do
      post :index, :format => :xml
      response.code.should eq("200")
    end
  end

  describe "POST index.json returns json response" do
    it "should be json data" do
      video = stub_model Video, :save => true
      post :index, :format => :json
      response.body.class.should == [video].to_json.class
    end

    it "should be xml data" do
      video = stub_model Video, :save => true
      post :index, :format => :xml
      response.body.class.should == [video].to_xml.class
    end
  end

end


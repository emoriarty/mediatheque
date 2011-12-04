require 'spec_helper'

describe SessionsController do
  render_views
  
  describe "GET 'signin'" do
    it "returns http success" do
      get 'signin'
      response.should be_success
    end
    
    it "shows the 'signin' template" do
      get 'signin'
      response.should render_template 'signin'
    end
  end
  
  describe "POST 'signin'" do
    context "when the user sign in with wrong credentials" do
      it "should render the template signin" do
        mock_model(User).as_new_record
        post 'signin'
        
        #flash[:error].should eq("User/Password is wrong")
        response.should render_template 'signin'
      end
    end
  end

  describe "GET 'signout'" do
    it "returns http success" do
      get 'signout'
      response.should be_success
    end
  end

end

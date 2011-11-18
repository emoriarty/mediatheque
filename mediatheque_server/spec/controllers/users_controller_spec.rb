require 'spec_helper'

describe UsersController do
  render_views
  
  before :each do
    @attr = { "email" => "emoriarty81@gmail.com", 
      "name" => "Enrique",
      "nick" => "emoriarty",
      "password" => "secret",
      "password_confirmation" => "secret" }
  end
  
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    before :each do
      user = mock_model_with_errors User  
    end

    it "instance a new user" do
      get 'new'
    end
    
    it "shows the 'new' template" do
      get 'new'
      response.should render_template 'new'
    end
  end

  describe "POST 'create'" do
    let :user do
      mock_model_with_errors User, @attr.merge(:save => true)
    end
    
    before do
      User.stub(:new).and_return user
    end
    
    it "creates a new user" do  
      User.should_receive(:new).with(@attr).and_return user
      post 'create', :user => @attr
    end
    
    it "saves the user" do
      user.should_receive(:save).and_return true
      post 'create'
    end
    
    context "when the user saves succesfully" do
      it "sets a flash[:notice] message" do
        post 'create'
        flash[:notice].should eq("Account created successfully")
      end
      
      it "redirects to the login with a succesful message" do
        post 'create'
        response.should redirect_to login_path
      end
    end
    
    context "when the user fails to save" do
      it "renders the template 'new'" do
        user.stub(:save).and_return false
        post :create
        response.should render_template 'new'
      end
    end
  end

end

require 'spec_helper'

describe "users/new.html.erb" do
  let :user do
    mock_model(User).as_new_record.as_null_object
  end
  
  before :each do
    @builder = WebAppThemeFormBuilder.new :user, user, self, {}, nil
  end
  
  it "renders an empty form to create a user" do
    user.stub(:email).and_return ""
    user.stub(:name).and_return ""
    user.stub(:nick).and_return ""
    user.stub(:password).and_return ""
    user.stub(:password_confirmation).and_return ""
    assign :user, user
    render
    within 'form' do |f|
      f.should have_selector "input[type='text'][name='user[email]'][value='']"
      f.should have_selector "input[type='text'][name='user[name]'][value='']"
      f.should have_selector "input[type='text'][name='user[nick]'][value='']"
      f.should have_selector "input[type='text'][name='user[password]'][value='']"
      f.should have_selector "input[type='text'][name='user[password_confirmation]'][value='']"

      f.should have_selector 'button', :type => "submit"
    end
  end
  
  it "doens't show template _error_message" do
    view.should_not render_template :partial => "shared/_error_message"
  end
  
  describe "shows template _error_messages" do
    before :each do
      user = mock_model_with_errors User  
    end
    
    after :each do
      assign :user, user
      render
      view.should render_template :partial => "shared/_error_message"
    end
    
    it "when email don't be validate" do
      user.errors.add :email
    end
    
    it "when name don't be validate" do
      user.errors.add :name
    end
    
    it "when nick don't be validate" do
      user.errors.add :nick
    end
    
    it "when password don't be validate" do
      user.errors.add :password
    end
    
    it "when password_confirmation don't be validate" do
      user.errors.add :password_confirmation
    end
  end
  
end

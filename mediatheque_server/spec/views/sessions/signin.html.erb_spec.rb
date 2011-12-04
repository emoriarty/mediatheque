require 'spec_helper'

describe "sessions/signin.html.erb" do
  let :user do
    mock_model(User).as_new_record.as_null_object
  end
  
  before :each do
    @builder = WebAppThemeFormBuilder.new :user, user, self, {}, nil
  end
  
  it "renders an empty form demanding user's credentials" do
    user.stub(:nick).and_return ""
    user.stub(:password).and_return ""
    assign :user, user
    render
    within 'form' do |f|
      f.should have_selector "input[type='text'][name='user[nick]'][value='']"
      f.should have_selector "input[type='text'][name='user[password]'][value='']"

      f.should have_selector 'button', :type => "submit"
    end
  end
  
  it "doens't show template _error_message" do
    view.should_not render_template :partial => "shared/_error_message"
  end
  
  describe "shows template _error_messages" do
    it "when nick or password is wrong should show error message" do
      user = mock_model_with_errors User  
      user.stub(:nick).and_return ""
      user.stub(:password).and_return ""
      assign :user, user
      flash[:error] = "User/Password is wrong"
      render
      
      view.should render_template :partial => "shared/_error_message"
    end
  end
end

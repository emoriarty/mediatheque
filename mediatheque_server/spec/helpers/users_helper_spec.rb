require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe UsersHelper do
  before(:each) do
    @object = mock_model User
    @object.stub!(:email).and_return "emoriarty81@gmail.com"
    @object.stub!(:name).and_return "Enrique"
    @object.stub!(:nick).and_return "enric"
    @object.stub!(:password).and_return "secret"
    @object.stub!(:password_confirmation).and_return "secret"
    @builder = UsersFormBuilder.new :user, @object, self, {}, nil
  end
  
  it "should build input field for email" do
    @builder.text_fields(:email, :name, :nick, :password, :password_confirmation).should have_selector('div.group') do |fields|
      fields.should have_selector("input[name='user[email]][value='emoriarty81@gmail.com']")
      fields.should have_selector("input[name='user[name]][value='Enrique']")
      fields.should have_selector("input[name='user[nick]][value='enric']")
      fields.should have_selector("input[name='user[password]][value='secret']")
      fields.should have_selector("input[name='user[password_confirmation]][value='secret']")
    end
  end
  
end

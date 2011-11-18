require 'spec_helper'

describe User do
  before :each do
    @attr = { :name => 'Enrique', 
      :nick => 'enric', 
      :email => 'emoriarty81@gmail.com', 
      :password => 'secret', 
      :password_confirmation => 'secret' }
  end
  
  it "is valid with valid attributes" do
    user = User.create @attr
    user.should be_valid
  end
  it "is not valid without a name" do 
    user = User.create @attr.merge(:name => '')
    user.should_not be_valid
  end
  
  it "is not valid without a nick" do
    user = User.create @attr.merge(:nick => '')
    user.should_not be_valid
  end
  
  it "is not valid without a email" do
    user = User.create @attr.merge(:email => '')
    user.should_not be_valid
  end
  
  it "is not valid whitout a password" do
    user = User.create @attr.merge(:password => '')
    user.should_not be_valid
  end  
  
  it "is not valid whitout a password confirmation" do
    user = User.create @attr.merge(:password_confirmation => '')
    user.should_not be_valid
  end
end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  surname_1  :string(255)
#  surname_2  :string(255)
#  nick       :string(255)
#  password   :string(255)
#  birthday   :date
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#


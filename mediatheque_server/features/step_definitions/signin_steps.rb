When /^I fill sign in fields with (.*), (.*)/ do |user, password|
  steps %Q{
    When I fill in "Nick" with #{user}
	  And I fill in "Password" with #{password}
  }
end
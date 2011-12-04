When /^I fill sign up fields with (.*), (.*), (.*), (.*), (.*)/ do |name, nick, email, password, password_confirmation|
  steps %Q{
    When I fill in "Name" with #{name}
		And I fill in "Nick" with #{nick}
		And I fill in "Email" with #{email}
	  And I fill in "Password" with #{password}
	  And I fill in "Password confirmation" with #{password_confirmation}
  }
end

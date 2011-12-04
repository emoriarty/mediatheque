Feature: Sign in
	
	As a user who has an account created
	I want to sign in
	So I will be able to manage my account
	
	Scenario: I sign in with failure
		Given I am on the "signin" page
		When I fill sign in fields with "", "secret"
		And I press "Sign in"
		Then I should see "User/Password is wrong"
	
	@wip
	Scenario: I sing in with nick
		Given I am on the "signin" page
	  When I fill sign in fields with "Enric", "secret"
	  And I press "Sign in"
	  Then I am on the "home" page
		And I should see "Enric"
	
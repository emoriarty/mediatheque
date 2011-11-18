Feature: Signup
	
	As an unauthorized user
	I want to signup with my details
	So that I have a user account
	
	Scenario: Password doesn't match confirmation
	  Given I am on the signup page
	  When I fill sign up fields with "Enrique", "Enric", "emoriarty81@gmail.com", "secret", "password"
	  And I press "Sign up"
	  Then I should see "Password doesn't match confirmation"
	
	Scenario: All fields are correct
		Given I am on the signup page
	  When I fill sign up fields with "Enrique", "Enric", "emoriarty81@gmail.com", "secret", "secret"
	  And I press "Sign up"
	  Then I should see "Account created successfully"
	
	Scenario: Fields name, nick, and email are blank
	  Given I am on the signup page
	  When I fill sign up fields with "", "", "", "secret", "secret"
	  And I press "Sign up"
	  Then I should see "Email can't be blank"
		And I should see "Name can't be blank"
		And I should see "Nick can't be blank"
	
	@wip	
	Scenario Outline: Email should be not validated
		Given I am on the signup page
		When I fill sign up fields with "Enrique", "Enric", "<email>", "secret", "secret"
		And I press "Sign up"
		Then I should see "<message>" 
		
		Scenarios: email wrong validations
			| email                  | message          |
			| emoriarty81gmail.com   | Email is invalid |
			| emoriarty81@gmailcom   | Email is invalid |
			| emoriarty81gmailcom    | Email is invalid |
			| emoriarty81@gmail.com  |                  |
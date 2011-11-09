Feature: User is created
	
	I can register in the app to register the movies I've got in my computer or simply adding manually
	As a user
	I want to see my movies listed
	
	@wip
	Scenario: Show a list of my movies
		Given a new user
		When I want to see a list of my movies
		Then the returned list is empty
		
	Scenario: The movies list has to be paginated
		Given a movies list
		When is the list is more than 20 items
		Then has to be paginated
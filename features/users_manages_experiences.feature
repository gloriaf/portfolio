Feature: User manges experinces
    In order to manage user experiences
    As an user
    I want add, update, delete, show experiences about a user
    
    Background: users and experiences in database
	Given a valid user
	And I am on the login page
	And I fill in "Email" with "mgfernandez@pabilos.com"
	And I fill in "Password" with "palabraclave"
	And I press "Sign in"
	Then I should see "Mary"
	
    Scenario: User add a new experience
    	Given I am on the new experience page for "Mary"
#	Then show me the page
	And I fill in "Name" with "Test"
	And I fill in "Year" with "2012"
	When I press "Create"
	Then I should be on the show experience page "Test" of "Mary"
	And I should see "Test"

    Scenario: User not add a new experience	    
    	Given I am on the new experience page for "Mary"
	And I fill in "Name" with ""
	And I fill in "Year" with "2012"
	When I press "Create"
	And I should see an error message

    Scenario: New experience about a experience and back
	Given I am on the new experience page for "Mary"
	When I follow "Back"
	Then I should be on the experience page for "Mary"
    
    Scenario: Show a experience of user
        Given the following experiences exists for "Mary"
	And I am on the experience page for "Mary"
	When I go to the show experience page "Ruby Project 2" of "Mary"
#	Then show me the page
	Then I should see "Experience of Mary"
	And I should see "Ruby Project 2" 
    
    Scenario: Show experience about a user and back to experience list
        Given the following experiences exists for "Mary"
	And I am on the experience page for "Mary"
#	Then show me the page
	When I go to the show experience page "Ruby Project 4" of "Mary"
	Then I should see "Experience of Mary"
	When I follow "Back to experience list"
	Then I should be on the experience page for "Mary"
    
    Scenario: Show experience about a user and edit
        Given the following experiences exists for "Mary"
	And I am on the show experience page "Ruby Project 6" of "Mary"
	When I follow "Edit experience"
	Then I should be on the edit experience page "Ruby Project 6" of "Mary"
	And I should see "Edit Experience of Mary" 
    
   Scenario: Edit and update experience 
        Given the following experiences exists for "Mary"
	And I am on the edit experience page "Ruby Project 8" of "Mary"
	Then I should see "Edit Experience of Mary"
	When I press "Update experience"
	Then I should be on the show experience page "Ruby Project 8" of "Mary"

   Scenario: Edit and not update experience 
        Given the following experiences exists for "Mary"
	And I am on the edit experience page "Ruby Project 10" of "Mary"
	Then I should see "Edit Experience of Mary"
	When I fill in "Year" with "0"
	And I press "Update experience"
#	Then show me the page
	And I should see an error message

   Scenario: Edit and back to show page 
        Given the following experiences exists for "Mary"
	And I am on the edit experience page "Ruby Project 12" of "Mary"
	Then I should see "Edit Experience of Mary"
	When I follow "Back"
	Then I should be on the experience page for "Mary"


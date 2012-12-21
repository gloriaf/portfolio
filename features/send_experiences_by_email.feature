Feature: User send resumo of experiences by e-mail
    In order to inform others about the experiences of one user
    As an user
    I want to send a email whit the experiences 
    
    Background: users and experiences in database
	Given a valid user
	And I am on the login page
	And I fill in "Email" with "mgfernandez@pabilos.com"
	And I fill in "Password" with "palabraclave"
	And I press "Sign in"
	Then I should see "Mary"
	
    Scenario: Send an email with the experiences of the user
        Given the following experiences exists for "Mary"
    	And I am on the experience page for "Mary"
	Then I should see "summary"
	And I should see "Ruby Project"
	When I follow "Send the summary of the experience by email"
	Then I should be on the experience page for "Mary"
#	Then show me the page
	And I should see "Ruby Project"


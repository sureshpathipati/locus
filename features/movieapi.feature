Feature: Movie API TestCases

Scenario: To Validate Api response of movie api without Bearer token
Given I choose 'MOVIES' api
When I hit the endpoint
Then I should see Unauthorized message

Scenario: To Validate Api response of movie api with Bearer token
Given I choose 'MOVIES' api
When I add Bearer token
And I hit the endpoint
Then I should see movies list in the response

Scenario: To Validate Api response of movie quote api with Bearer token
Given I choose 'MOVIES' api
When I add Bearer token
And I hit the endpoint
And I choose any movie id
And I choose selected movieQuote api
And I hit the endpoint
Then I should see only the respective movie quotes

Scenario: To Validate Api response of movie quote api without Bearer token 
Given I choose a valid movie quote api without bearer token
When I hit the endpoint
Then I should see Unauthorized message
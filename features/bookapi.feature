Feature: Book API TestCases

Scenario: To Validate Api response of book api
  Given I choose 'BOOKS' api
  When I hit the endpoint
  Then I should see only "3" books returned in the response

Scenario: To Validate Api response of a respective book
	Given I choose 'BOOKS' api
  When I hit the endpoint
  And I choose any book id
  And I hit the endpoint
  Then I should see only the respective book details

Scenario: To Validate Api response when invalid book id is passed
  Given I choose selected Book api with book id as "5cinvalid300kid"
  When I hit the endpoint
  Then I should see error message

Scenario: To Validate Api response of a respective book chapter
	Given I choose 'BOOKS' api
  When I hit the endpoint
  And I choose any book id
  And I choose selected BookChapter api
  And I hit the endpoint
  Then I should see only the respective book chapters

Scenario: To Validate Api response when invalid book id is passed to book chapter api
	Given I choose selected BookChapter api with book id as "5cinvalid300kid"
  When I hit the endpoint
  Then I should see error message 
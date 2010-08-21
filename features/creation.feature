Feature: Comment creation

  Scenario: Anonymous users can not comment
    Given an anonymous session
    And a commentable exists
    When I go to the commentables page
    And I click on "Show"
    Then the "login error" box contains "You have to be logged to comment."

  Scenario: When the user creates a content then he is redirected to the content show action
    Given a regular user session
    And a commentable exists
    When I go to the commentables page
    And I click on "Show"
    And I fill in "Content" with "This is a test comment" within "new comment"
    And I submit the form "new comment"
    Then the current page is a "show" action
    And the "comments box" box contains "This is a test comment"
    And the flash box contains "Your comment was added."

  Scenario: Comment's content can not be empty
    Given a regular user session
    And a commentable exists
    When I go to the commentables page
    And I click on "Show"
    And I submit the form "new comment"
    Then the current page is a "show" action
    And the flash box contains "Your comment could not be added: Content can't be blank"

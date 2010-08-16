Feature: Comment creation

    Scenario: Anonymous users can not comment
        Given an anonymous session
        And a commentable exists
        When I go to commentables page
        And I click on "Open"
        Then there is a "login-form" box within "comments" box

    Scenario: When the user creates a content then he is redirected to the content show action
        Given a regular user session
        And a commentable exists
        When I go to commentables page
        And a commentable exists
        And I type "This is a test comment" in the "content" field of the "new comment" form
        Then the current page is a "show" action
        And the "comments" box contains "This is a test comment"

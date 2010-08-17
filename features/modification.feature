Feature: Comments can be deleted and modified under some conditions
    Admin users can delete any comment.

    The author of the comment can edit it and delete it only during the first 30 minutes after create it.

    Any other user can only read it.

    Scenario: Admin user can delete any comment
        Given an admin session
        And a commentable exists with these comments:
            | content                      | created_at       |
            | Text for the deleted comment | 2010-01-01 01:01 |
        When I go to commentables page
        And I click on "Open"
        And I click on "delete" within "comment item" box
        Then the current page is a "show" action
        And the page does not contain "Text for the deleted comment"

    Scenario: Comments can be modified during 30 minutes by its author
        Given a user with email: "john@example.com"
        And a session for the user "john@example.com"
        And a commentable exists with these comments:
            | content                  | created_at       | user             |
            | Original comment content | 29 minutes ago   | john@example.com |
        When I go to commentables page
        And I click on "Open"
        And I click on "edit" within the "comment item" box
        And I type "This is a different text" in the "content" field of the "modify comment" form
        Then the current page is a "show" action
        And the page does not contain "Original comment content"
        And the page contains "This is a different text"

    Scenario: Comments can be deleted during 30 minutes by its author
        Given a user with email: "john@example.com"
        And a session for the user "john@example.com"
        And a commentable exists with these comments:
            | content                  | created_at       | user             |
            | Original comment content | 29 minutes ago   | john@example.com |
        When I go to commentables page
        And I click on "Open"
        And I click on "delete" within "comment item" box
        Then the current page is a "show" action
        And the page does not contain "Original comment content"

    Scenario: After 30 minutes the author can not modify its comment
        Given a user with email: "john@example.com"
        And a session for the user "john@example.com"
        And a commentable exists with these comments:
            | content                  | created_at       | user             |
            | Original comment content | 31 minutes ago   | john@example.com |
        When I go to commentables page
        And I click on "Open"
        Then the current page is a "show" action
        And there is no link with "edit" text within "comment item"

    Scenario: After 30 minutes the author can not delete its comment
        Given a user with email: "john@example.com"
        And a session for the user "john@example.com"
        And a commentable exists with these comments:
            | content                  | created_at       | user             |
            | Original comment content | 31 minutes ago   | john@example.com |
        When I go to commentables page
        And I click on "Open"
        Then the current page is a "show" action
        And there is no link with "delete" text within "comment item"

    Scenario: Other users can not modify nor delete the comment
        Given an anonymous session
        And a commentable exists with these comments:
            | content                  | created_at       |
            | Original comment content | 10 minutes ago   |
        When I go to commentables page
        And I click on "Open"
        Then the current page is a "show" action
        And there is no link with "edit" text within "comment item"
        And there is no link with "delete" text within "comment item"

Feature: Comments can be deleted and modified under some conditions
  Admin users can delete any comment.

  The author of the comment can edit it and delete it only during the first 30 minutes after create it.

  Any other user can only read it.

  Scenario: Admin user can delete any comment
    Given an admin session
    Given a user: "john" exists with email: "john@example.com"
    And a commentable: "first" exists
    And the following comments exist:
      | content                      | created_at     | user         | commentable          |
      | Text for the deleted comment | 50 minutes ago | user: "john" | commentable: "first" |
    When I go to the commentables page
    And I click on "Show"
    And I click on "Destroy" within "edit comment"
    Then the current page is a "show" action
    And the page does not contain "Text for the deleted comment"

  Scenario: Comments can be modified during 30 minutes by its author
    Given a user: "john" exists with email: "john@example.com"
    And a session for the user "john@example.com"
    And a commentable: "first" exists
    And the following comments exist:
      | content                  | created_at       | user         | commentable          |
      | Original comment content | 29 minutes ago   | user: "john" | commentable: "first" |
    When I go to the commentables page
    And I click on "Show"
    And I click on "Edit" within "comment item"
    And I fill in "Content" with "This is a different text" within "modify comment"
    And I submit the form
    Then the current page is a "show" action
    And the page does not contain "Original comment content"
    And the page contains "This is a different text"

  Scenario: Comments can be deleted during 30 minutes by its author
    Given a user: "john" exists with email: "john@example.com"
    And a session for the user "john@example.com"
    And a commentable: "first" exists
    And the following comments exist:
      | content                  | created_at       | user         | commentable          |
      | Original comment content | 29 minutes ago   | user: "john" | commentable: "first" |
    When I go to the commentables page
    And I click on "Show"
    And I click on "Destroy" within "comment item"
    Then the current page is a "show" action
    And the page does not contain "Original comment content"

  Scenario: After 30 minutes the author can not modify its comment
    Given a user: "john" exists with email: "john@example.com"
    And a session for the user "john@example.com"
    And a commentable: "first" exists
    And the following comments exist:
      | content                  | created_at       | user         | commentable          |
      | Original comment content | 31 minutes ago   | user: "john" | commentable: "first" |
    When I go to the commentables page
    And I click on "Show"
    Then the current page is a "show" action
    And the "comment item" box does not contain "Edit"

  Scenario: After 30 minutes the author can not delete its comment
    Given a user: "john" exists with email: "john@example.com"
    And a session for the user "john@example.com"
    And a commentable: "first" exists
    And the following comments exist:
      | content                  | created_at       | user         | commentable          |
      | Original comment content | 31 minutes ago   | user: "john" | commentable: "first" |
    When I go to the commentables page
    And I click on "Show"
    Then the current page is a "show" action
    And the "comment item" box does not contain "Destroy"

  Scenario: Other users can not modify nor delete the comment
    Given an anonymous session
    And a user: "john" exists with email: "john@example.com"
    And a commentable: "first" exists
    And the following comments exist:
      | content                  | user         | commentable          |
      | Original comment content | user: "john" | commentable: "first" |
    When I go to the commentables page
    And I click on "Show"
    Then the current page is a "show" action
    And the "comment item" box contains "Original comment content"
    And the "comment item" box does not contain "Edit"
    And the "comment item" box does not contain "Destroy"

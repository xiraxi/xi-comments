Feature: Comments listing

  Scenario: Show actions list all the comments of the parent ordered by creation timestamp
    Given an anonymous session
    And a commentable: "any" exists
    And the following comments exist:
      | content | created_at     | commentable        |
      | Two     | 20 minutes ago | commentable: "any" |
      | Three   | 10 minutes ago | commentable: "any" |
      | One     | 30 minutes ago | commentable: "any" |
    When I go to the commentables page
    And I click on "Show"
    Then the "comments box" box has these boxes in the same order:
      | comment item | One   |
      | comment item | Two   |
      | comment item | Three |

  Scenario: Show actions have a #comments link
    Given an anonymous session
    And a commentable: "any" exists
    And the following comments exist:
      | content | created_at     | commentable        |
      | Two     | 20 minutes ago | commentable: "any" |
      | Three   | 10 minutes ago | commentable: "any" |
      | One     | 30 minutes ago | commentable: "any" |
    When I go to the commentables page
    And I click on "Show"
    Then there is a link with "3 comments" text within "comments"
    And the link "3 comments" has the attribute "name" set to "comments"
    And the link "3 comments" has the attribute "href" set to "#comments"

  Scenario: Every comment has a fixed format
    Given an anonymous session
    And a commentable: "any" exists
    And a user: "john" exists with name: "John", surname: "Smith"
    And the following comments exist:
      | content | created_at     | commentable        | user         |
      | One     | 30 minutes ago | commentable: "any" | user: "john" |
    When I go to the commentables page
    And I click on "Show"
    Then the "comments box" box has these boxes in the same order:
      | user photo | tag: img                             |
      | metadata   | Created 30 minutes ago by John Smith |
      | text       | One                                  |

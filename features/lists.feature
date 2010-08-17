Feature: Comments listing

    Scenario: Show actions list all the comments of the parent ordered by creation timestamp
        Given an anonymous session
        And a commentable exists with this comments:
            | content | created_at       |
            | Two     | 2010-01-01 01:02 |
            | Three   | 2010-01-02 00:00 |
            | One     | 2010-01-01 01:01 |
        When I go to commentables page
        And I click on "Open"
        Then the page has these boxes in the same order:
            | box          | content | position |
            | comment item | One     | #1       |
            | comment item | Two     | #2       |
            | comment item | Three   | #2       |

    Scenario: Show actions have a #comments link
        Given an anonymous session
        And a commentable exists with this comments:
            | content | created_at       |
            | One     | 2010-01-01 01:01 |
            | Two     | 2010-01-01 01:02 |
            | Three   | 2010-01-02 00:00 |
        When I go to commentables page
        And I click on "Open"
        Then there is a link with "3 comments" text within "comments"
        And the link "3 comments" points to "#comments"
        And the link "3 comments" has the attribute "name" set to "comments"

    Scenario: Every comment has a fixed format
        Given an anonymous session
        And a user with name: "John Smith", login: "john@example.com"
        And a commentable exists with this comments:
            | content | created_at | user             |
            | One     | 2010-01-01 | john@example.com |
        When I go to commentables page
        And I click on "Open"
        Then the page contains these boxes within "comments":
            | icon     | tag: img   |
            | position | 1          |
            | user     | John Smith |
            | creation | 2010-01-01 |
            | content  | One        |

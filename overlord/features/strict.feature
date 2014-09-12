Feature: User cannot "hack" the bomb
  As a user
  I should not be allowed to cheat

  Scenario: I try to view the "boom" page without arming the bomb
    Given I am on the arming page
    When I navigate to "/boom"
    Then I should see "This is a bomb"

  @disarm
  Scenario: I am penalized when I try to view the "boom" page without forcing the bomb to explode
    Given I have activated the bomb
    When I navigate to "/boom"
    Then I should see a warning with "2" retries left

  @disarm
  Scenario: I am penalized when I try to deactivate the bomb by navigating back to the arming page
    Given I have activated the bomb
    When I navigate to "/"
    Then I should see a warning with "2" retries left

  Scenario: I try to navigate to a non-existent page
    Given I am on the arming page
    When I navigate to "/does-not-exist"
    Then I should see "This is a bomb"

  @disarm
  Scenario: I cannot escape deactivation by navigating to a non-existent page when the bomb is armed and get penalized for trying
    Given I have activated the bomb
    When I navigate to "/does-not-exist"
    Then I should see a warning with "2" retries left

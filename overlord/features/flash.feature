Feature: Flash messages
  As a user
  I don't want to see notice messages repeat when I refresh the page

  Scenario: I only see the deactivated message once on deactivation
    Given I have activated the bomb
    When I fill in "deactivation_code" with "1234"
    And I click "submit"
    Then I should see "Bomb successfully deactivated"
    When I refresh the page
    Then I should not see "Bomb successfully deactivated"

  @disarm
  Scenario: I only see the retry message once per misstep
    Given I have activated the bomb
    When I fill in "deactivation_code" with "123"
    And I click "submit"
    Then I should see a warning with "2" retries left
    When I refresh the page
    Then I should not see a warning with "2" retries left

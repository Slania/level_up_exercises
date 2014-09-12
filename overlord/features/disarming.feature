Feature: Disarming the bomb
  As a user
  I should enter a valid deactivation code
  In order to disarm the bomb

  Scenario: I enter a valid deactivation code
    Given I have activated the bomb
    When I fill in "deactivation_code" with "1234"
    And I click "submit"
    Then I should see "Bomb successfully deactivated"

  @disarm
  Scenario: I enter a invalid deactivation code
    Given I have activated the bomb
    When I fill in "deactivation_code" with "123"
    And I click "submit"
    Then I should see a warning with "2" retries left

  Scenario: I enter an invalid deactivation code 3 times
    Given I have activated the bomb
    When I fill in "deactivation_code" with "first_try"
    And I click "submit"
    Then I should see a warning with "2" retries left
    When I fill in "deactivation_code" with "first_try"
    And I click "submit"
    Then I should see a warning with "1" retries left
    When I fill in "deactivation_code" with "first_try"
    And I click "submit"
    Then I should see "Boom, be*ch!"

@regression
Feature: Network issues

  @android
  Scenario: Check app warning message during airplane mode
    Given I am on the 'Welcome' screen
    When I activate Airplane mode
    * I wait 10 seconds
    Then I am on the 'InternetUnreachable' screen
    When I activate Wifi mode
    * I wait 10 seconds
    Then I am on the 'Welcome' screen
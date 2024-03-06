@regression
Feature: Chat support menu

  @ignore
  Scenario: Check Chat flow, tap call support button
    Given I am on the 'Welcome' screen
    When I tap on the 'SignIn' button
    Then I am on the 'SignIn' screen
    When I am sign in as "ZERO_HOMES" user with "validated" phone number
    Then I am on the 'Alarm' screen with "subscription is needed" status
    When I tap on the 'Three dots' menu
    * I tap on the 'Chat' menu
    Then I am on the 'Chat' screen
    When I wait 5 seconds
    Then I am on the 'Chat' screen
    When I tap on the 'Call Support' button
    Then I am on the 'Native Phone' Screen, for Android
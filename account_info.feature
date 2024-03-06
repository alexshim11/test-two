@regression
Feature: Account information

  Scenario: Check correct user information in the My account
    Given I am on the 'Welcome' screen
    When I tap on the 'SignIn' button
    Then I am on the 'SignIn' screen
    When I am sign in as "ZERO_HOMES" user with "validated" phone number
    Then I am on the 'Alarm' screen with "subscription is needed" status
    When I tap on the 'Three dots' menu
    * I tap on the 'Account' menu
    Then I am on the 'Account' screen
    When I tap on the 'My account' button
    Then I am on the 'My Account' screen
    * I see correct user information
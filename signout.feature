@regression
Feature: Sign Out flow

  @smoke
  Scenario: Check fully Sign Out flow
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
    When I tap on the 'Log Out' button
    Then I am on the 'Confirmation Log Out' screen
    When I tap on the 'Cancel' button
    Then I am on the 'My Account' screen
    When I tap on the 'Log Out' button
    Then I am on the 'Confirmation Log Out' screen
    When I tap on the 'Confirmation Log Out' button
    Then I am on the 'Welcome' screen
    When I relaunch the app
    Then I am on the 'Welcome' screen
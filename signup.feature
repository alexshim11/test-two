@regression @android
Feature: Sign Up

  Background: Open the app, go to Sign Up screen
    Given I am on the 'Welcome' screen
    When I tap on the 'Create an account' button
    Then I am on the 'Enter First Name' screen

  Scenario: Back button should redirect to previous Welcome screen
    When I tap on the 'Close' button
    Then I am on the 'Welcome' screen

  Scenario: Impossible to use email which already has used with another account
    When I fill "First Name" field with "Test" value
    * I tap on the 'Next' button
    Then I am on the 'Enter Last Name' screen
    * I fill "Last Name" field with "Test" value
    * I tap on the 'Next' button
    Then I am on the 'Enter Email' screen
    * I fill "Email" field with "test@test.co" value
    * I tap on the 'Next' button
    Then I am on the 'Create Password' screen
    When I fill "valid" password
    * I tap on the 'Sign Up' button on the Create Password Screen
    Then I see 'This account email address is already in use' error

  Scenario: Show password button should be work like expected
    When I sign up with the new user
    Then I am on the 'Create Password' screen
    When I fill "valid" password
    * I tap on the 'Show Password' button on the Create Password Screen
    Then Password should be visible

  Scenario: Sign Up with invalid phone code, resend code, sign up with the new code
    When I sign up with the new user
    Then I am on the 'Create Password' screen
    When I fill "valid" password
    * I tap on the 'Sign Up' button on the Create Password Screen
    Then I am on the 'Submit Phone Number' screen
    When I fill "valid" phone number
    * I tap on the 'Done' button on the Submit Phone Number Screen
    Then I am on the 'SecurityCode' screen
    When I get and save phone code
    * I fill "incorrect" phone code
    Then I see 'Incorrect' phone code message
    When I wait 6 seconds, for iOS
    * I tap on the 'Didn't receive a code' button
    * I fill "saved" phone code
    Then I see 'Incorrect' phone code message
    When I fill "correct" phone code
    Then I am on the 'Alarm' screen with "subscription is needed" status

  @smoke
  Scenario: Full Sign Up flow with the new user
    When I sign up with the new user
    Then I am on the 'Create Password' screen
    When I fill "valid" password
    * I tap on the 'Sign Up' button on the Create Password Screen
    Then I am on the 'Submit Phone Number' screen
    When I fill "valid" phone number
    * I tap on the 'Done' button on the Submit Phone Number Screen
    Then I am on the 'SecurityCode' screen
    When I fill "correct" phone code
    Then I am on the 'Alarm' screen with "subscription is needed" status
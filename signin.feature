@regression
Feature: Sign In flow

  Background: Open the app, go to Sign In screen
    Given I am on the 'Welcome' screen
    When I tap on the 'SignIn' button
    Then I am on the 'SignIn' screen

  @smoke
  Scenario: Sign In as valid user and phone status
    When I am sign in as "ZERO_HOMES" user with "validated" phone number
    Then I am on the 'Alarm' screen with "subscription is needed" status

  Scenario: Sign In with invalid user data
    When I am sign in as "INCORRECT_USER" user with "validated" phone number
    Then I see 'Account is not recognized' message

  Scenario: Sign In with invalid phone code, resend code, sign in with the new code
    When I am sign in as "ZERO_HOMES" user with "unvalidated" phone number
    Then I am on the 'SecurityCode' screen
    When I get and save phone code
    * I fill "incorrect" phone code
    Then I see 'Incorrect' phone code message
    When I wait 6 seconds, for iOS
    When I tap on the 'Didn't receive a code' button
    * I fill "saved" phone code
    Then I see 'Incorrect' phone code message
    When I get and save phone code
    * I fill "saved" phone code
    Then I am on the 'Alarm' screen with "subscription is needed" status
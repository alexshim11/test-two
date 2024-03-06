@regression
Feature: Delete user

  Scenario: User can delete his own account from the app
    Given I am on the 'Welcome' screen
    When I tap on the 'Create an account' button
    Then I am on the 'Enter First Name' screen
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
    When I tap on the 'Three dots' menu
    * I tap on the 'Account' menu
    Then I am on the 'Account' screen
    When I tap on the 'My account' button
    Then I am on the 'My Account' screen
    When I tap on the 'Delete Account' button
    Then I am on the 'Confirmation Delete User' screen
    When I tap on the 'Cancel Deleting User' button
    Then I am on the 'My Account' screen
    When I tap on the 'Delete Account' button
    Then I am on the 'Confirmation Delete User' screen
    When I tap on the 'Confirmation Delete User' button
    Then I am on the 'Welcome' screen
    When I tap on the 'SignIn' button
    Then I am on the 'SignIn' screen
    When I sign in with the current user
    Then I see 'Account is not recognized' message
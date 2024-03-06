@regression
Feature: Forgot Password flow

  Scenario: Check Account not recognized error
    Given I am on the 'Welcome' screen
    When I tap on the 'SignIn' button
    Then I am on the 'SignIn' screen
    When I tap on the 'Forgot Password' button
    Then I am on the 'Forgot Password' screen
    When I enter "aaaaa@aaaa.com" to the email field
    When I tap on the 'Next' button
    Then I see 'This account is not recognised' error

  Scenario: Check forgot password flow with not validated email
    Given I set "test@test.co" user email status to "false" using API
    * I am on the 'Welcome' screen
    When I tap on the 'SignIn' button
    Then I am on the 'SignIn' screen
    When I tap on the 'Forgot Password' button
    Then I am on the 'Forgot Password' screen
    When I tap on the 'Close' button
    Then I am on the 'SignIn' screen
    When I tap on the 'Forgot Password' button
    When I enter "test@test.co" to the email field
    When I tap on the 'Next' button
    Then I am on the 'Email Sent' screen
    When I tap on the 'Done' button
    Then I am on the 'Forgot Password' screen

  Scenario: Check forgot password flow with validated email
    Given I set "test@test.co" user email status to "true" using API
    * I am on the 'Welcome' screen
    When I tap on the 'SignIn' button
    Then I am on the 'SignIn' screen
    When I tap on the 'Forgot Password' button
    Then I am on the 'Forgot Password' screen
    When I enter "test@test.co" to the email field
    When I tap on the 'Next' button
    Then I am on the 'EmailVerificationCode' screen
    When I get and save email code
    * I fill "incorrect" email code
    Then I see 'Incorrect' email code message
    When I tap on the 'Haven't receive an email code' button
    * I fill "saved" email code
    Then I see 'Incorrect' email code message
    When I get and save email code
    * I fill "saved" email code
    Then I am on the 'Alarm' screen with "subscription is needed" status

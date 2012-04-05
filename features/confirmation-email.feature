Feature: Confirmation email at signup

  Scenario: New sign up
    Given a user signs up
    Then they should receive a confirmation email

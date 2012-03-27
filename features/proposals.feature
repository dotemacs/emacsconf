Feature: Allow users to propose what they want to see at Emacs Conf


  Background:
    When the users sign up

  Scenario: Add talk list
    When the user logs in
    Then they should be able to make a proposal

  Scenario: Allow voting for talks
    When there are proposals
    Then the users should be able to vote on the proposals

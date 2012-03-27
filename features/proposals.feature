Feature: Allow users to propse what they want to see at Emacs Conf


  Background:
    When the users sign up

  Scenario: Add talk list
    When the user logs in
    Then they should be able to make a proposal

  Scenario: The users should be able to vote on proposal
    When there are proposals
    Then the users should be able to vote on the proposals

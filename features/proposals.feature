Feature: Allow users to propose what they want to see at Emacs Conf


  Background:
    When the users sign up
    When the user logs in

  Scenario: Add talk list
    Then they should be able to make a proposal

  Scenario: Allow voting for talks
    When there are proposals
    Then the users should be able to vote on the proposals

  Scenario: Proposal list
    When there are proposals
    Then any user should be able to view them
    But only the signed up users should be able to add them

  Scenario: Proposal discussion
    When there are proposals
    Then the signed in users should be able to comment on them

  Scenario: Proposal comment users
    When there is a proposal with a comment
    Then it should show who made the comment

Feature: Start Game
As a user, I want to be able to start a new game so I can play Hangman

Scenario: User can start a new game
  Given I am on the home page
  When I start a new game
  Then I should be taken to a new game
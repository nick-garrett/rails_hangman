Feature: New Game
As a user, I want to be able to start a new game once the previous game has been completed

Scenario: User can start a new game when a game is finished
  Given I have won a game
  When I make a new game
  Then I should be taken to a new game
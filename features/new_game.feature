Feature: New Game
As a user, I want to be able to click a button to start a new game after a previous game is finished

Scenario: User can click the button to start a new game
  Given I have won a game
  When I click the new game button
  Then I should be taken to a new game
Feature: Home Page
As a user, I want to be able to click a button to start a new game

Scenario: User can click the button to start a new game
  Given I am on the home page
  When I click the start game button
  Then I should be taken to a new game
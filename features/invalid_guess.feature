Feature: Invalid Guess
As a user, if I enter a guess that is not valid (non-alphabetic characters) I get an error saying that it is an invalid character.

Scenario: User can enter an invalid guess and expect an error message
  Given I have started a new game
  When I submit the guess "!"
  Then I should see "Letter is invalid"
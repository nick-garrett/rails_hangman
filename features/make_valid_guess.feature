Feature: Make Valid Guess
As a user, I want to be able to enter a valid guess into the form, and it should add the guess to the guessed letters.

Scenario: User can enter guess and click button to add it to guessed letters
  Given I am on a new game page
  When I submit a guess
  Then I should see the guess added to the list of guessed letters
  
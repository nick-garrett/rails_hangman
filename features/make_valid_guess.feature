Feature: Make Valid Guess
As a user, I want to be able to enter a valid guess into the form, and it should add the guess to the guessed letters.

Scenario: User can enter a valid guess and see it in the guessed letters
  Given I have started a new game
  When I submit the guess "t"
  Then I should see "t" in the guessed letters

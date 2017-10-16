Feature: Won Feature
As a user, when all of the letters in the word have been guessed correctly, I expect to be shown a message saying you that I won.

Scenario: User enters correct letters and expects won message
  Given I have started a new game
  When I submit the guesses "w,o,r,d"
  Then I should see a won message
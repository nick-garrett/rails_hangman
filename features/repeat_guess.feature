Feature: Repeat guess
As a user, when I repeat the same guess, I want to be told that I have already made this guess

Scenario: User enters the same guess twice and expects an error message
Given I have started a new game
When I submit the guess "t"
And I submit the guess "t"
Then I should see "Already guessed this letter"
Feature: Lost Feature
As a user, when I run out of lives, I should see a lost message

Scenario: User enters incorrect letters and expects lost message
  Given I have started a new game
  When I submit the guesses "a,b,c,e,f,g,h,i,j,k"
  Then I should see "You lost!"
Feature: Lost Feature
As a user, when I run out of lives, I should see a lost message

Scenario: User enters incorrect letters and expects lost message
  Given I have started a new game
  When I submit the guess "a"
  When I submit the guess "b"
  When I submit the guess "c"
  When I submit the guess "e"
  When I submit the guess "f"
  When I submit the guess "g"
  When I submit the guess "h"
  When I submit the guess "i"
  When I submit the guess "j"
  When I submit the guess "k"
  Then I should see "You lost!"
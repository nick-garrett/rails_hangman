Given(/^I have won a game$/) do
  visit root_path
  steps %(
    When I start a new game
    And I submit the guess "w"
    And I submit the guess "o"
    And I submit the guess "r"
    And I submit the guess "d"
  )
end

When(/^I make a new game$/) do
  click_button('New Game')
end

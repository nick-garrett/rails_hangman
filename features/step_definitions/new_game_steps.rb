Given(/^I have won a game$/) do
  visit root_path
  steps %(
    When I click the start game button
    And I submit the guess "w"
    And I submit the guess "o"
    And I submit the guess "r"
    And I submit the guess "d"
  )
end

When(/^I click the new game button$/) do
  click_button('New Game')
end

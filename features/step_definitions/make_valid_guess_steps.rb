Given(/^I have started a new game$/) do
  visit root_path
  click_button('Start Game')
end

When(/^I submit the guess "(.)"$/) do |guess|
  fill_in 'guess[letter]', with: guess
  click_button('Submit')
end

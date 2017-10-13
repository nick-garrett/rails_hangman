When(/^I go to the home page$/) do
  visit root_path
end

Then(/^I should be able to start a new game$/) do
  click_button('Start Game')
  expect(page).to have_content('Guessed Letters')
end

Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I start a new game$/) do
  click_button('Start Game')
end

Then(/^I should be taken to a new game$/) do
  expect(page).to have_content('Guessed Letters')
end

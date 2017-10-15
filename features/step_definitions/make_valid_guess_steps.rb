# let(:guess) { 't' }

Given(/^I have started a new game$/) do
  visit root_path
  click_button('Start Game')
end

When(/^I submit the guess "(.)"$/) do |guess|
  fill_in 'guess[letter]', with: guess
  click_button('Submit')
end

Then(/^I should see the guess added to the list of guessed letters$/) do
  expect(page).to have_content('Guessed Letters: t')
end

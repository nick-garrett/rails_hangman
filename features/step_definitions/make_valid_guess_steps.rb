# let(:guess) { 't' }

Given(/^I am on a new game page$/) do
  visit root_path
  click_button('Start Game')
end

When(/^I submit a guess$/) do
  # enter guess into form ???
  fill_in "guess[letter]", with: 't'
  click_button('Submit')
end

Then(/^I should see the guess added to the list of guessed letters$/) do
  expect(page).to have_content('Guessed Letters: t')
end

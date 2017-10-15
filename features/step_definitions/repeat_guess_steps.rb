Then(/^I should see error "(.*)"$/) do |msg|
  expect(page).to have_content(msg)
end

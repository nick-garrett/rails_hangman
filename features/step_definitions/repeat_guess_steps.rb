Then(/^I should see a (.*)$/) do |msg|
  case msg
  when 'unique letter error'
    expect(page).to have_content('Letter has already been taken')
  when 'won message'
    expect(page).to have_content('You won!')
  when 'invalid letter error'
    expect(page).to have_content('Letter is invalid')
  when 'lost message'
    expect(page).to have_content('You lost!')
  end
end

Then(/^I should see "(.*)" in the guessed letters$/) do |msg|
  expect(page).to have_content('Guessed Letters: ' << msg)
end

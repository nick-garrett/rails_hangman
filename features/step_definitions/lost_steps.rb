When(/^I submit the guesses "([^"]*)"$/) do |guesses|
  guesses.split(',').each do |guess|
    steps %Q(When I submit the guess "#{guess}")
  end
end

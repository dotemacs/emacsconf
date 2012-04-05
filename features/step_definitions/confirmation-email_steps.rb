Given /^a user signs up$/ do
  visit '/users/sign_up'
  fill_in 'Name', :with => "Bob"
  fill_in 'Email', :with => "user@user.com"
  fill_in 'Password', :with => "qwerty"
  fill_in 'Password confirmation', :with => "qwerty"
  click_button 'Sign up'
end

Then /^they should receive a confirmation email$/ do
  open_email("user@user.com", :with_text => "Welcome user@user.com!")
end

When /^the users sign up$/ do
  FactoryGirl.create(:user)
end

When /^the user logs in$/ do
  visit '/users/sign_in'
  fill_in 'Email', :with => 'user@user.com'
  fill_in 'Password', :with => 'password'
  click_button 'Sign in'
end

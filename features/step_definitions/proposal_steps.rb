When /^the users sign up$/ do
  @user = FactoryGirl.create(:user)
end

When /^the user logs in$/ do
  visit '/users/sign_in'
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password
  click_button 'Sign in'
end

Then /^they should be able to make a proposal$/ do
  page.should have_content "Make a proposal"
end

When /^there are proposals$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the users should be able to vote on the proposals$/ do
  pending # express the regexp above with the code you wish you had
end

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
  click_link "Make a proposal"
  page.should have_content "New proposal"
  @proposal = FactoryGirl.attributes_for(:proposal)
  fill_in 'Subject', :with => @proposal[:subject]
  fill_in 'Body', :with => @proposal[:body]
  click_button 'Create Proposal'
  page.should have_content @proposal[:subject]
end

When /^there are proposals$/ do
  @proposal = FactoryGirl.create(:proposal)
  visit proposal_path(@proposal)
end

Then /^the users should be able to vote on the proposals$/ do
  page.should have_content "Vote up"
  page.should have_content "Vote down"
  click_link "Vote up"
  page.should have_content "Votes: 1"
end


Then /^any user should be able to view them$/ do
  @pro1 = FactoryGirl.create(:proposal)
  @pro2 = FactoryGirl.create(:proposal, :subject => "Wonderfully Emacs")
  visit '/'
  page.should have_content @pro1.subject
  page.should have_content @pro2.subject
end

Then /^only the signed up users should be able to add them$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the signed in users should be able to comment on them$/ do
  pending # express the regexp above with the code you wish you had
end

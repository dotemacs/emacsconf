When /^the users sign up$/ do
  @user = FactoryGirl.create(:user)
  @user.confirm!
end

When /^the user logs in$/ do
  visit '/users/sign_in'
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password
  click_button 'Sign in'
end

Then /^they should be able to make a proposal$/ do
  visit '/proposals'
  page.should have_content "Make a proposal"
  click_link "Make a proposal"
  page.should have_content "NEW PROPOSAL"
  @proposal = FactoryGirl.attributes_for(:proposal)
  fill_in 'Subject', :with => @proposal[:subject]
  fill_in 'Body', :with => @proposal[:body]
  click_button 'Create Proposal'
  page.should have_content @proposal[:subject].upcase
end

When /^there are proposals$/ do
  @proposal = @user.proposals.new(FactoryGirl.attributes_for(:proposal))
  @proposal.save
  visit proposal_path(@proposal)
end

Then /^the users should be able to vote on the proposals$/ do
  page.should have_content "Vote up"
  page.should have_content "Vote down"
  click_link "Vote up"
  page.should have_content "votes: 1"
end


Then /^any user should be able to view them$/ do
  @pro1 = FactoryGirl.create(:proposal)
  @pro2 = FactoryGirl.create(:proposal, :subject => "Wonderfully Emacs")
  visit '/'
  click_link 'Sign out'
  visit '/proposals'
  page.should have_content @pro1.subject
  page.should have_content @pro2.subject
end

But /^only the signed up users should be able to add them$/ do
  visit '/proposals/new'
  page.should have_content "Sign in"
end

Then /^the signed in users should be able to comment on them$/ do
  proposal_attr = FactoryGirl.attributes_for(:proposal,
                                             :subject => "Emacs Lisp",
                                             :body => "Lambda")
  @pro = @user.proposals.new(proposal_attr)
  @pro.save
  comment = "I wish to see this talk presented"
  visit proposal_path(@pro)
  page.should have_content "Contribute with your opinion:"
  fill_in 'comment_content', :with => comment
  click_button 'Add the comment'
  page.should have_content "Comment added, thank you for participating"
  page.should have_content comment
end

When /^a user creates a proposal or a comment$/ do
  visit '/proposals'
  click_link "Make a proposal"
  "Then they should be able to make a proposal"
  page.should have_content "Edit proposal"
end

When /^there is a proposal with a comment$/ do
  visit '/proposals'
  click_link "Make a proposal"
  fill_in 'Subject', :with => "Emacs sentience"
  fill_in 'Body', :with => "I want to think and it should be"
  click_button 'Create Proposal'
  @comment_string = "Great, I want to see this"
  fill_in 'comment_content', :with => @comment_string
  click_button 'Add the comment'
  page.should have_content @comment_string
end

Then /^it should show who made the proposal and the comment$/ do
  @proposal = Proposal.where(:body => "I want to think and it should be").first
  page.should have_content @proposal.user.name
  @comment = Comment.where(:content => @comment_string).first
  page.should have_content @comment.user.name
end

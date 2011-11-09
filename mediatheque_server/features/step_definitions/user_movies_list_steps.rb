Given /^a new user$/ do
  @user = User.create!
end

When /^I want to see a list of my movies$/ do
  @movies = @user.movies
end

Then /^the returned list is empty$/ do
  @movies.empty?.should be_true
end

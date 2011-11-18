When /^I create a video with title Alien$/ do
  visit videos_path
  click_link "Add Video"
  fill_in "Title", :with => "Alien"
  select "1979", :from => "Year"
  
  click_button "Save"
end

Then /^Alien should be in my videos list$/ do
  visit videos_path
  puts response
  response.should contain("Alien")
end
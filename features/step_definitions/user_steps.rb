require 'uri'
require 'cgi'


require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^the following users exists:$/ do |users_table|
  users_table.hashes.each do |user|
#    Topic.create!(topic)
    FactoryGirl.create(:user, user)
  end
end

Given /^the following experiences exists for "(.*?)"$/ do |n|
  @user=User.find_by_name(n)
    FactoryGirl.create(:experience, user: @user)
    FactoryGirl.create(:experience, user: @user)
end

Given /^a valid user$/ do
  @user = User.create!({
             :name => "Mary",
             :email => "mgfernandez@pabilos.com",
             :password => "palabraclave",
             :password_confirmation => "palabraclave"
           })
end

When /^I follow Details "(.*?)" of "(.*?)"$/ do |arg1, arg2|
  click_link(Show)
end


When /^I click on "Remove" link for "(.*?)"$/ do |name|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Then /^I should see "(.*)" before "(.*)"$/ do |e1, e2|
  body = page.html
  assert body.index(e1) < body.index(e2)
end

When /^I (un)?check the following topics_types: (.*?)$/ do | uncheck, types_list|
  types_list.split(',').each do |type|
    if uncheck
      uncheck("topics_types[#{type}]")
    else
      check("topics_types[#{type}]")
    end
  end
end

Then /^I should see all the topics$/ do
    page.all('table tr').count.should == Topic.count() + 1
end

Then /^I should see the (\d+) notes$/ do |cont|
  page.all('table tr').count.should == Integer(cont) + 1
end

Given /^I an on (.+)$/ do |page_name|
  visit path_to(page_name)
end


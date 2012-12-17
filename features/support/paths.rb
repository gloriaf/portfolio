# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /the login page/
      signin_path
    when /^the show page for "([^"]*)"$/
      user_path(User.find_by_name($1).id)
    when /^the experience page for "([^"]*)"$/
      user_experiences_path(User.find_by_name($1).id)
    when /^the new experience page for "([^"]*)"$/
      user=User.find_by_name($1)
      new_user_experience_path(user)
    when /^the show experience page "([^"]*)" of "([^"]*)"$/
      user=User.find_by_name($2)
      experience=user.experiences.find_by_name($1)
      user_experience_path(user, experience)
    when /^the edit experience page "([^"]*)" of "([^"]*)"$/
      user=User.find_by_name($2)
      expereince=user.experiences.find_by_name($1)
      edit_user_experience_path(user, expereince)
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

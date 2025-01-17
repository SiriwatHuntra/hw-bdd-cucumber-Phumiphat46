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
    
    when /^the (RottenPotatoes )?home\s?page$/ then '/movies' # Kp fixed this (part 1 warm up)
    when /^the Create New Movie page/ then '/movies/new'
    when /^the movies page$/ then '/movies'
    
    when /^the "Search Results" page$/ then 'movies/add'
      
    when /^the movies page$/ then '/movies'
      # Here is an example that uses value from the Regexp:
      #
      #   when /^the details page for movie "(.*)"$/ do |movie_name|
      #     movie_path(Movie.find_by(:name => movie_name))
      # end

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

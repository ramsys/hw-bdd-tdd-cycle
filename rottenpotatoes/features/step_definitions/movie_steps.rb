# Add a declarative step here for populating the DB with movies.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    new_movie = Movie.new
    new_movie.title = movie[:title]
    new_movie.rating = movie[:rating]
    new_movie.director = movie[:director]
    new_movie.release_date = movie[:release_date]
    new_movie.save
  end
  # fail "Unimplemented"
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  movie = Movie.find_by title: title
  movie.director.should == director
end

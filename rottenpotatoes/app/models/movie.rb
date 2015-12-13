class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.search_by_director(id)
    if id.is_a? Numeric
      movie = Movie.find(id)
      if movie.director && movie.director != ''
        return Movie.where(director: movie.director)
      end
    end
    return []
  end

end

# spec/factories/movie.rb

FactoryGirl.define do
  factory :movie, class: Movie do
    title 'A Fake Title' # default values
    rating 'PG'
    director 'Tarantino'
    release_date { 10.years.ago }
  end
end

require 'spec_helper'
require 'rails_helper'

describe Movie do
  describe "#title" do
    it "returns the correct title" do
        movie = Movie.new
        movie.title = "Title"
        movie.rating = movie[:rating]
        movie.director = movie[:director]
        movie.release_date = movie[:release_date]
        movie.title.should eql "Title"
    end
  end
  describe "#rating" do
      it "returns the correct rating" do
          movie = Movie.new
          movie.rating = "P"
          movie.rating.should eql "P"
      end
  end
  describe "#director" do
      it "returns the correct director" do
          movie = Movie.new
          movie.director = "Director"
          movie.director.should eql "Director"
      end
  end
  describe 'Search movies by Director' do
  #it 'should include rating and year in full name' do
    # 'build' creates but doesn't save object; 'create' also saves it
    # movie = FactoryGirl.build(:movie, :title => 'Milk', :rating => 'R')
    #movie.name_with_rating.should == 'Milk (R)'
    # print movie.find_by_director("Tarantino")
  #end
    fixtures :movies

    before :each do
      #movie = FactoryGirl.create(:movie, :title => 'A')
      #movie = FactoryGirl.create(:movie, :title => 'B')
      #movie = FactoryGirl.create(:movie, :title => 'C', :director => 'No Tarantino')
      movie1 = movies(:milk_movie)
      movie2 = movies(:food_movie)
      movie3 = movies(:feed_movie)
    end
    it 'should find movies by the same director' do
      movie = Movie.new
      Movie.search_by_director(1).length.should == 2
    end
    it 'should not find movies by different director' do
      movie = Movie.new
      movies = Movie.search_by_director(1)
      movies.each do |movie|
        movie.title.should_not == 'Food, Inc. 2'
      end
    end
    it 'when the specified movie has no director, it should return blank list' do
      movie = Movie.new
      Movie.search_by_director("").length.should == 0
    end
  end
end

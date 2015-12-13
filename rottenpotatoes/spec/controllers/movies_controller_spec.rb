require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  describe 'searching by Director' do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it 'should call the model method that performs search by Director' do
      movie = Movie.new
      Movie.should_receive(:search_by_director).with(1).and_return(@fake_results)
      get :search_by_director, id: 1
      # response.should be_success
    end
    it 'should select the Search Results template for rendering' do
      Movie.stub(:search_by_director).and_return(@fake_results)
      get :search_by_director, id: 1
      response.should render_template('search_by_director')
    end
    it 'should make the by_Director search results available to that template' do
      Movie.stub(:search_by_director).and_return(@fake_results)
      get :search_by_director, id: 1
      assigns(:movies).should == @fake_results
    end
    it 'should show a message when search has no director' do
      Movie.stub(:search_by_director).and_return([])
      get :search_by_director, id: ""
      assigns(:movies).should == []
    end
  end
end

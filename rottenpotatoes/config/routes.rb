Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')

  get 'movies/search_by_director/:id', to: 'movies#search_by_director', as: :search_by_director
  #post 'movies/search_by_director', to: 'movies#search_by_director', as: :search_by_director
end

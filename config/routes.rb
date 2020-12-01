Rails.application.routes.draw do
  resources :movies
  get '/search/:search_term', to:'movies#search_movies'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

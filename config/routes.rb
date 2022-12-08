Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#welcome'
  get 'summoner_matches', to: 'summoner_matches#index'
end

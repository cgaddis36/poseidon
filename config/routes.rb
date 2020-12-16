Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/zip', to: 'sessions#update'
  get '/zip_tides', to: 'sessions#patch'
  get '/tides', to: 'tides#show'
  get '/forecast', to: 'forecast#show'
  get '/fly', to: 'fly#index'
  get '/bait', to: 'bait#index'
  get '/tournament', to: 'tournament#index'
  get '/tips', to: 'tips#index'
  get '/maps', to: 'maps#show'
  get '/bait_search', to: 'bait#search'
  get '/fly_search', to: 'fly#search'
  get '/about', to: 'about#index'
end

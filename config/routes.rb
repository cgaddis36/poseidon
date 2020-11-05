Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/zip', to: 'sessions#update'
  get '/forecast', to: 'forecast#show'
  get '/fly', to: 'fly#index'
  get '/bait', to: 'bait#index'
  get '/tournament', to: 'tournament#index'
  get '/tips', to: 'tips#index'
end

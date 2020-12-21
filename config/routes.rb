Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/about', to: 'about#index'

  post '/store', to: 'store#create'
  get '/store/:store_id', to: 'store#show'
  get '/store/:store_id/review/new', to: 'review#new'
  post 'store/:store_id/review', to: 'review#create'

  get '/user', to: 'user#show'
  patch '/user', to: 'user#update'
  get '/user/edit', to: 'user#edit'
  post '/user', to: 'sessions#creation'
  get '/logout', to: 'sessions#destroy'
  get '/register', to: 'user#new'
  get '/login', to: 'welcome#login'
  post '/login', to: 'sessions#create'

  get '/zip', to: 'sessions#update'
  get '/zip_tides', to: 'sessions#patch'
  get '/tides', to: 'tides#show'
  get '/forecast', to: 'forecast#show'
  get '/fly', to: 'fly#index'
  get '/fly_search', to: 'fly#search'
  get '/bait', to: 'bait#index'
  get '/bait_search', to: 'bait#search'
  get '/guide', to: 'guide#index'
  get '/guide_search', to: 'guide#search'
end

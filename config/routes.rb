Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root to: "home#index"
  resources :user   
  resources :routes

  # get '/announcement/:id', to: 'announcement#show'
  # get '/announcement/', to: 'announcement#index'
  #
  # get '/assigned_route/:id', to: 'assigned_route#show'
  # get '/assigned_route/', to: 'assigned_route#index'
  #
  # get '/available_wall/:id', to: 'available_wall#show'
  # get '/available_wall/', to: 'available_wall#index'
  #
  # get '/comment/:id', to: 'comment#show'
  # get '/comment/', to: 'comment#index'
  #
  # get '/maintenance_request/:id', to: 'maintenance_request#show'
  # get '/maintenance_request/', to: 'maintenance_request#index'
  #
  # get '/rating/:users_id', to: 'rating#show'
  # get '/rating/', to: 'rating#index'
  #
  # get '/route/:id', to: 'route#show'
  # get '/route/', to: 'route#index'
  #
  # get '/small_group/:id', to: 'small_group#show'
  # get '/small_group/', to: 'small_group#index'
  #
  # get '/support_ticket/:id', to: 'support_ticket#show'
  # get '/support_ticket/', to: 'support_ticket#index'

  # get '/user/:id', to: 'user#show'
  # get '/user/', to: 'user#index'
end

Rails.application.routes.draw do

  devise_for :users

  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
  namespace :api, defaults: { format: :json } do
    resources :authentication,      :only => [:create, :destroy]
    resources :announcement,        :only => [:show, :index]
    resources :assigned_route,      :only => [:show, :index]
    resources :available_wall,      :only => [:show, :index]
    resources :comment,             :only => [:show, :index]
    resources :maintenance_request, :only => [:show, :index]
    resources :rating,              :only => [:show, :index]
    resources :route,               :only => [:show, :index]
    resources :small_group,         :only => [:show, :index]
    resources :support_ticket,      :only => [:show, :index]
    resources :user,                :only => [:show, :index]
  end
  root to: "home#index"
  resources :user,                :only => [:show, :index]

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

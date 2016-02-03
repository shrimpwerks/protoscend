Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root to: "home#index"
  resources :users
  resources :routes
  resources :assigned_route
end

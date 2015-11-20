Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root to: "home#index"
  resources :user
  resources :routes
  resources :assigned_route
end

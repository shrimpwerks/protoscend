Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users, controllers: {
    registrations: "registrations"
  }

  get 'charts/routes', to: 'charts#routes', as: :routes_chart

  resources :users

  resources :routes do
    resources :comments
  end

  resources :assigned_routes

  resources :ratings

  resources :maintenance_requests do
    member do
      get :resolve
    end
  end

  resources :announcements
end

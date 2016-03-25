Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root to: "home#index"
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
end

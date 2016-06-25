Rails.application.routes.draw do

  namespace :admin do
    root to: "home#index"
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

  root to: "home#index"
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  resources :users, only: [:index, :show]
  resources :routes, only: [:index, :show] do
    resources :comments
  end
  resources :ratings

end

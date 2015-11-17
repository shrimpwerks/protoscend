Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "registrations"
  }
  root to: "home#index"
  resources :register,   :only => [:index]
  resources :user        #:only => [:show, :index, :create]
  
end

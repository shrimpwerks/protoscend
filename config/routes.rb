Rails.application.routes.draw do
  resources :user, :only => [:show]
end

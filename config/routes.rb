Rails.application.routes.draw do
  resources :user, :only => [:show]
  resources :support_ticket, :only => [:show]
end

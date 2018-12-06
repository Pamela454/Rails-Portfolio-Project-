Rails.application.routes.draw do
  root "users#home"
  resources :patients
  resources :physicians do
    resources :messages
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

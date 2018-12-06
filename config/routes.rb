Rails.application.routes.draw do
  root "users#home"
  resources :users do
    resources :patients
    resources :physicians
  end

    resources :patients do
      resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

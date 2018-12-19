Rails.application.routes.draw do
  root "application#welcome"
  get '/auth/facebook/callback' => 'sessions#create'
  get 'users/signin' => 'users#signin'
  post 'sessions/create' => 'sessions#create'

  get 'users/new_patient' => 'users#new'
  post 'users/new_patient' => 'users#create'

  resources :users do
    resources :patients
    resources :physicians
  end

  resources :sessions
  resources :patients do
      resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

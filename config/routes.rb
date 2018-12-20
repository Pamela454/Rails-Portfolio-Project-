Rails.application.routes.draw do
  root "application#welcome"
  get '/auth/facebook/callback' => 'sessions#create'

  get 'users/signin' => 'users#signin'
  post 'sessions/create' => 'sessions#create'

  get 'users/new_patient' => 'users#new_patient'
  post 'users/new_patient' => 'users#create'

  get 'users/new_physician' => 'users#new_physician'
  post 'users/new_physician' => 'users#create'

  get '/users/:user_id/patients/:id/edit' => 'users#edit_patient'
  patch '/users/:user_id/patients/:id/edit' => 'users#update'

  get '/users/:user_id/patients/:id/edit' => 'users#edit_physician'
  patch '/users/:user_id/patients/:id/edit' => 'users#edit_physician'

  get '/users/:user_id/messages/:id/edit' => 'users#edit_response'
  patch '/users/:user_id/messages/:id/edit' => 'messages#update'

  resources :users do
    resources :patients
    resources :physicians
    resources :messages
  end

  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

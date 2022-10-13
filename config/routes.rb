Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#welcome" 

  get '/auth/facebook/callback' => 'sessions#create'

  get 'users/signin' => 'users#signin'
  post 'sessions/create' => 'sessions#create'

  get 'users/new_patient' => 'patients#new'
  post 'users/new_patient' => 'users#create'

  get 'users/new_physician' => 'physicians#new'
  post 'users/new_physician' => 'users#create'

  #get '/users/:user_id/responses/:id/edit' => 'users#edit_response'
  #patch '/users/:user_id/messages/:id/edit' => 'messages#update'

  get  '/logout',   to: 'sessions#destroy', via: :delete

  resources :users do  
    resources :messages, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :responses, only: [:new, :create, :edit, :update, :destroy]
    resources :patients, only: [:edit, :update]
  end
end

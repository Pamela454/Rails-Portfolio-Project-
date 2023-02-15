Rails.application.routes.draw do
  root "application#welcome" 

  get 'auth/facebook/callback' => 'sessions#create'

  get 'users/signin', to: 'sessions#new'
  post 'users/signin', to: 'sessions#create'

  get 'users/new_patient' => 'patients#new'
  post 'users/new_patient' => 'users#create'

  get 'users/new_physician' => 'physicians#new'
  post 'users/new_physician' => 'users#create'

  #get '/users/:user_id/messages' => 'messages#new'
  #patch '/users/:user_id/messages/:id/edit' => 'messages#update'
  #post 'users/:user_id/messages/new' => 'messages#create'

  get 'users/:user_id/responses/new' => 'responses#new'
  post 'users/:user_id/responses/new' => 'responses#create'

  get  '/logout',   to: 'sessions#destroy', via: :delete

  resources :users do  
    resources :messages, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :responses, only: [:new, :create, :edit, :update, :destroy]
    resources :patients, only: [:edit, :update]
    resources :physicians, only: [:edit, :update]
  end

  resources :categories do
    resources :message_categories
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

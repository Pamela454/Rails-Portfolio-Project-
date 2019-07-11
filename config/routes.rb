Rails.application.routes.draw do
  #disguising presence of another resource?
  root "application#welcome" #only routes get requests

  get '/auth/facebook/callback' => 'sessions#create'

  get 'users/signin' => 'users#signin'
  post 'sessions/create' => 'sessions#create'

  get 'users/new_patient' => 'patients#new'
  post 'users/new_patient' => 'users#create'

  get 'users/new_physician' => 'physicians#new'
  post 'users/new_physician' => 'users#create'

  #get '/users/:user_id/responses/:id/edit' => 'users#edit_response'
  #patch '/users/:user_id/messages/:id/edit' => 'messages#update'

  delete  '/logout',   to: 'sessions#destroy', via: :delete

  resources :users do  #use shallow method?
    resources :messages, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :responses, only: [:new, :create, :edit, :update, :destroy]
    resources :patients, only: [:edit, :update]
    resources :physicians, only: [:edit, :update]
  end

  #index, show, new, edit, create, update and destroy actions -resource
  resources :categories do
    resources :message_categories
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end #http://localhost:3000/rails/info/routes available routes, rails routes

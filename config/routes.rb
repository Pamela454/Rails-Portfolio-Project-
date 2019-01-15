Rails.application.routes.draw do
  #disguising presence of another resource?
  root "application#welcome" #only routes get requests

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

  get '/users/:user_id/responses/:id/edit' => 'users#edit_response'
  patch '/users/:user_id/messages/:id/edit' => 'messages#update'


  resources :users do  #use shallow method?
    resources :messages, :responses
  end
  #index, show, new, edit, create, update and destroy actions -resource
  resources :categories do
    resources :message_categories
  end

  get  '/logout',   to: 'sessions#destroy', via: :delete
  get  'users/:id/messages/:id',   to: 'messages#destroy', via: :delete


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end #http://localhost:3000/rails/info/routes available routes, rails routes

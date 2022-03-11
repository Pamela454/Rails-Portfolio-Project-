Rails.application.routes.draw do

  root "application#welcome" 

  get '/auth/facebook/callback' => 'sessions#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get 'users/new_patient' => 'patients#new'
  post 'users/new_patient' => 'users#create'

  get 'users/new_physician' => 'physicians#new'
  post 'users/new_physician' => 'users#create'

  get  '/logout',   to: 'sessions#destroy', via: :delete

  resources :users do  
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

Rails.application.routes.draw do
  resources :clubs
  resources :books
  resources :users
  resources :shelves
  resources :memberships
  resources :discussions
  resources :comments

  resources :sessions

  root 'static#index'
  get 'about', to: 'static#about'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  namespace :admin do 
    resources :users
  end

  delete '/signout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

end

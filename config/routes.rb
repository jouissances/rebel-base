Rails.application.routes.draw do
  root 'static#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :clubs
  resources :books
  resources :shelves
  resources :memberships
  resources :discussions
  resources :comments

  get '/about', to: 'static#about'

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

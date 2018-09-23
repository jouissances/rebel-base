Rails.application.routes.draw do
  resources :clubs
  resources :books
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#index'
  get 'about', to: 'static#about'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

end

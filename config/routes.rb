Rails.application.routes.draw do
  root 'static#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :clubs do
    resources :shelves do
      resources :books do
        member do
          patch :set_as_current
        end
      end
    end
  end

  resources :memberships
  resources :discussions
  resources :comments
  resources :readings

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

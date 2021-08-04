Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/leaderboard', to: 'bands#index'
  
  

  resources :reviews
  resources :venues do 
    resources :shows, only: [:new, :create, :index]
  end 
  resources :musicians
  resources :bands do 
    post 'practice', to: 'bands#practice'
  end 
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

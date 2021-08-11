Rails.application.routes.draw do
  root to: 'sessions#welcome'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/musicians/available', to: 'musicians#available'

  resources :venues do 
    resources :shows, only: [:new, :create, :index]
  end 
  resources :shows do 
    resources :reviews, only: [:new, :create, :show]
  end 
  resources :musicians
  resources :bands do 
    post 'practice', to: 'bands#practice'
  end 
  resources :users
 
  get '*path' => redirect('/')
end

Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to "sessions#omniauth"
  
  resources :reviews
  resources :shows
  resources :venues
  resources :musicians
  resources :bands
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

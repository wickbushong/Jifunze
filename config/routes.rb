Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  post 'logout' => 'session#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  resources :users, only: [:show]
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  post 'logout' => 'session#destroy'

  get '/auth/facebook/callback' => 'session#create_from_facebook'

  get '/lessons/physics' => 'lessons#physics'

  resources :users, only: [:show] do
    resources :lessons, only: [:show, :index, :new, :create]
  end

  resources :lessons

  post 'lessons/:id/book' => 'lessons#book', as: "book"

end

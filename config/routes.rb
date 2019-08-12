Rails.application.routes.draw do
  get 'sessions/new'
  get 'cookiegram/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  '/signup',  to: 'users#new'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :posts do
    resources :comments
  end

  root 'cookiegram#index'
end

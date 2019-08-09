Rails.application.routes.draw do
  get 'cookiegram/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  '/signup',  to: 'users#new'

  resource :users

  resources :posts do
    resources :comments
  end

  root 'cookiegram#index'
end

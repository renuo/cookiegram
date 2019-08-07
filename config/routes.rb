Rails.application.routes.draw do
  get 'cookiegram/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  root 'cookiegram#index'
end

Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'items/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items
  resources :users

  # Defines the root path route ("/")
  # root "articles#index"
end

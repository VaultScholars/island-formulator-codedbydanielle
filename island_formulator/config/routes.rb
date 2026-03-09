Rails.application.routes.draw do
  resources :inventory_items
  resources :recipes
  resources :passwords, param: :token
  get "users/new"
  get "users/create"
  resource :session
  resources :users, only: [:new, :create]

  resources :ingredients
  resources :inventory_items

  root "ingredients#index"
end

Rails.application.routes.draw do
  get "dashboards/show"
  resources :batches
  resources :inventory_items
  resources :recipes
  resources :passwords, param: :token
  get "users/new"
  get "users/create"
  resource :session
  resources :users, only: [:new, :create]

  resources :ingredients
  resources :inventory_items
  resources :batches, only: [:index, :show, :new, :create, :destroy]

  root "dashboards#show"
end

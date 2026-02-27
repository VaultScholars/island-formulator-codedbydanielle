Rails.application.routes.draw do
  resources :recipes
  resources :passwords, param: :token
  get "users/new"
  get "users/create"
  resource :session
  resources :users, only: [:new, :create]

  resources :ingredients
  root "ingredients#index"
end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users
  resources :posts, only: [:show, :new, :update, :create]
  root to: "users#index"
end

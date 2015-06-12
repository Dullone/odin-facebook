Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users
  resources :posts, only: [:show, :new, :update, :create, :index]
  resources :friend_links, only: [:new, :create, :destroy]
end

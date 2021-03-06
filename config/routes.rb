Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users
  resources :posts do
    resources :comments, only: [:new, :create, :delete]
  end
  resources :friend_links, only: [:new, :create, :destroy, :index, :update]
  resources :likes, only: [:create, :destroy]
  get 'help' => 'static_pages#help'
end

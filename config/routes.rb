Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users do 
    resources :posts, only: [:show, :new, :update]
  end
  root to: "users#index"
end

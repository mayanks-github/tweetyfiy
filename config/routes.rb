Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root "homes#index"
  resources :profile, only: [:create, :update,]
  resources :posts, only: [:create, :post, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :update, :destroy]
  resources :follows, only: [:create, :destroy]
end
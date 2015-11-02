Rails.application.routes.draw do
  devise_for :users

  resources :users, except: [:new, :destroy] do
    resources :messages, only: [:new, :create]
  end

  resources :posts, except: [:updated, :edit, :show]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :messages, only: [:index, :destroy]

  root 'posts#index'
end

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :movies, only: [:new, :create]
  resources :comments, only: [:create]
end

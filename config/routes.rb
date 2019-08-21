Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :movies, only: [:new, :create]
end

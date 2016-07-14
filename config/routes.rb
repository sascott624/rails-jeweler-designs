Rails.application.routes.draw do
  root 'welcome#home', as: 'welcome'

  devise_for :users

  resources :users, only: [:show]
  resources :designs
  resources :stones

end

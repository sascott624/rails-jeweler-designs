Rails.application.routes.draw do
  root 'welcome#home', as: 'welcome'

  devise_for :users

  resources :users
  resources :designs
  resources :stones

end

Rails.application.routes.draw do
  root 'welcome#home', as: 'welcome'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users

  resources :users, only: [:show] do
    resources :designs, only: [:index, :new]
  end

  resources :designs
  resources :stones

end

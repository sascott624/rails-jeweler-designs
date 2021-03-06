Rails.application.routes.draw do
  root 'welcome#home', as: 'welcome'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users

  resources :users, only: [:show] do
    resources :designs, only: [:index, :create, :new, :show, :edit, :update]
  end

  resources :users, only: [:show] do
    resources :stones, only: [:index, :new, :show]
  end

  resources :designs, only: [:index, :create, :update]
  resources :stones, only: [:index, :create, :new, :show]

  get '/necklaces' => 'designs#necklaces', as: 'necklaces'
  get '/bracelets' => 'designs#bracelets', as: 'bracelets'
  get '/rings' => 'designs#rings', as: 'rings'
  get '/earrings' => 'designs#earrings', as: 'earrings'


end

Rails.application.routes.draw do
  root 'welcome#home', as: 'welcome'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users
  resources :designs
  resources :stones

end

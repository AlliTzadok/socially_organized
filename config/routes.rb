Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'welcome#home'

  resources :posts
  resources :platforms, only: [:index, :show, :new, :create]
  resources :calendars


end

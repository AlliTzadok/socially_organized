Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'welcome#index'
  get '/dashboard', to: 'users#dashboard'

  resources :posts
  resources :calendars

  resources :users do
    resources :calendars
  end

  resources :calendars do
    resources :posts
  end

end

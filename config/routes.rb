Rails.application.routes.draw do
  authenticated :user do
    root 'welcome#home', as 'authenticated_root'
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/auth/facebook/callback' => 'sessions#create'

  resources :posts
  resources :platforms
  resources :calendars

  root 'welcome#home'
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  unauthenticated do
    root :to => 'welcome#index'
  end

  authenticated do
    root :to => 'users#dashboard'
  end

  resources :posts
  resources :calendars

  resources :users do
    resources :calendars
  end

  resources :calendars do
    resources :posts
  end

end

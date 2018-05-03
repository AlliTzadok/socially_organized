Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  unauthenticated do
    root :to => 'welcome#index'
  end

  authenticated do
    root :to => 'users#dashboard'
  end

  resources :calendars
  resources :posts

  resources :calendars, only: [:index, :create, :update] do
    resources :posts
  end


  resources :users do
    resources :calendars
  end

end

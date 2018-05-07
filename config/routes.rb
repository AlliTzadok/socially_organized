Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  unauthenticated do
    root :to => 'welcome#index'
  end

  authenticated do
    root :to => 'users#dashboard'
  end

  get 'posts/finalized', to: 'posts#finalized', as: 'finalized_posts'
  get 'posts/drafted', to: 'posts#drafted', as: 'drafted_posts'

  resources :calendars, only: [:index, :create, :update] do
    resources :posts
  end

  resources :users do
    resources :calendars
  end

  resources :posts do
    resources :calendar_posts
  end

  get 'calendar_posts', to: 'calendar_posts#index', as: 'scheduled_calendar_posts'

  resources :posts

end

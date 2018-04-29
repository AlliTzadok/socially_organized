Rails.application.routes.draw do
  resources :user_calendars
  resources :platform_posts
  resources :calendar_posts
  resources :posts
  resources :platforms
  resources :calendars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

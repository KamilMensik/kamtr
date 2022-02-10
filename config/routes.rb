Rails.application.routes.draw do
  devise_for :users

  root "g#index"
  
  get 'g/user/:id(.:format)', to: 'g#user'
  put "post/:id/like", to: "posts#like", as: "like"
  put "post/:id/unlike", to: "posts#unlike", as: "unlike"
  get "g/user"
  get "admin", to: "admin#all"
  resources :posts
  resources :users
  resources :likes
end

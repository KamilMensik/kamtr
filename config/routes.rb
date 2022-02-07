Rails.application.routes.draw do
  devise_for :users

  root "g#index"
  
  get 'g/user/:id(.:format)', to: 'g#user'
  get "g/user"

  resources :posts
end

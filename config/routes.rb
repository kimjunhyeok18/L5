Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #routes.rbを設定する(resources :users, root 'users#index')
  resources :users
  resources :tweets
  resources :likes
  root 'users#index'
  post '/users/create', to: 'users#create'
end

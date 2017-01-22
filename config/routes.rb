Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :users
  root 'posts#index'


end

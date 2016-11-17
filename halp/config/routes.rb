Rails.application.routes.draw do

  resources :users
  resource :session
  resources :posts do
    resources :comments
  end

  root 'posts#index'


end

Rails.application.routes.draw do

  devise_for :installs
  resources :posts do
    resources :comments
  end

  root 'posts#index'

end

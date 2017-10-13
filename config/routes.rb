Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  resources :posts do
    resources :comments do
      member do
        put "like" => "comments#vote"
      end
    end
  end
  resources :users
  root 'posts#index'

  get '/meetup/:city/:name' to: 'meetup#show', as: 'meetup'
  root 'meetup#get_meetup'
end

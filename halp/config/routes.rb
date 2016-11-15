Rails.application.routes.draw do
  get 'show_session' => 'sessions#index'
  get 'set_session' => 'sessions#set_session'
  get 'another' => 'sessions#another'

  resource :sessions

  resources :posts do
    resources :comments
  end

  root 'posts#index'

end

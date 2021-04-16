Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  root to: 'tweets#index'

  resources :tweets do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
end
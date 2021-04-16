Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  root to: 'tweets#index'

  resources :tweets, only: :show do
    resources :comments, only: [:create]
    # collection do
    #   get 'search'
    end

  resources :groups, only: [:index, :new, :create, :show] do
    resources :tweets, except: :show
  end

end
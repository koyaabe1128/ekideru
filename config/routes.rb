Rails.application.routes.draw do
  
  devise_for :users
  root 'places#index'
  
  resources :places, only: [:show] do
    collection do
      get :search
      get :building
      get :landmark
    end
    resources :favorites, only: [:create, :destroy]
  end
  
  namespace :admin do
    resources :places do
      collection do
        get :list
      end
    end
  end
  
  resources :users, only: [:show]

end

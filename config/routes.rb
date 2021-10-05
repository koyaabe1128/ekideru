Rails.application.routes.draw do
  
  devise_for :users
  root 'places#index'
  
  resources :places, only: [:show] do
    resources :favorites, only: [:create, :destroy]
    collection do
      get :search
      get :destination
      get :exit
    end
  end
  
  namespace :admin do
    resources :places do
      collection do
        get :destination
      end
    end
  end
  
  resources :users, only: [:show]

end

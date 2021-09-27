Rails.application.routes.draw do
  
  get 'users/show'
  devise_for :users
  root 'places#index'
  
  resources :places, only: [:show] do
    collection do
      get :search
      get :building
      get :landmark
    end
  end
  
  resources :users, only: [:show]

  
end

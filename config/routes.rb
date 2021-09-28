Rails.application.routes.draw do
  
  devise_for :users
  root 'places#index'
  
  resources :places, only: [:show] do
    collection do
      get :search
      get :building
      get :landmark
    end
  end
  
  namespace :admin do
    resources :places
  end
  
  resources :users, only: [:show]

end

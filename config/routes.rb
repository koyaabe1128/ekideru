Rails.application.routes.draw do
  
  root 'places#index'
  
  resources :places, only: [:show] do
    collection do
      get :search
      get :building
      get :landmark
    end
  end
  
end

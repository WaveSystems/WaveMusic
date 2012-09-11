WaveMusic::Application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :registrations, only: [:create, :update]
      resources :sessions, only: [:create, :destroy]
    end
  end
end

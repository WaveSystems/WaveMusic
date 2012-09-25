WaveMusic::Application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  namespace :api do

    namespace :v1 do

      resources :registrations, only: [:create]
      resources :sessions, only: [:create, :destroy]

      resources :stream, only: [:index] do
        collection do
          get :upload
          post :save
        end
        member do
          get :download
          get :play
          delete :delete
        end
      end

      resources :music, :only => [:index, :create, :destroy]

    end

  end

end

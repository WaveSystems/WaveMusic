WaveMusic::Application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :registrations, :only => [:new, :create, :edit, :update]
      resources :sessions, :only => [:new, :create, :edit, :update]
    end
  end
end

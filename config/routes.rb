Rails.application.routes.draw do
  resources :tours
  resources :centers,param: :name ,only: [:show] do
    collection do
      get :events
    end
  end
  resources :contact ,only: [:index, :create]
  resources :appointments
  resources :physicians,param: :name ,only: [:index,:show] do
    collection do
      get :search
    end
  end
  resources :our_locations ,only: [:index] do
    collection do
      get :search
    end
  end
  resources :about ,only: [:index]
  resources :services ,only: [:index]
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  get '/set_location', to: 'home#set_location'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

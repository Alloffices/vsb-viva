Rails.application.routes.draw do
  resources :centers,param: :name ,only: [:show]
  resources :contact ,only: [:index]
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
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

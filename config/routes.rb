Rails.application.routes.draw do
  resources :contact ,only: [:index]
  resources :physicians ,only: [:index]
  resources :our_locations ,only: [:index]
  resources :about ,only: [:index]
  resources :services ,only: [:index]
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root "locations#index"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]
  resources :locations
  resources :categories, only: [:show, :index]
end

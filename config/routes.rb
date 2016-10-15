Rails.application.routes.draw do
  root "locations#index"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]
  resources :locations do
    resources :categories, only: [:index] do
      resources :workouts
    end
  end
  resources :categories, only: [:index]

end

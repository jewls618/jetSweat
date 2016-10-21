Rails.application.routes.draw do
  root "locations#index"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :locations do
    resources :categories, only: [:index] do
      resources :workouts
    end
  end

  resources :workouts do
    resources :comments
  end

  resources :workouts do
    resources :favorites
  end

  resources :favorites
end

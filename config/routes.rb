Rails.application.routes.draw do
  root "locations#index"
  get "/pages/:page" => "pages#show"
  get "pages/about" => "pages#show"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :locations do
    resources :categories, only: [:index] do
      resources :workouts
    end
  end

  resources :workouts do
    resources :comments, except: [:index]
  end

  resources :workouts do
    resources :favorites
  end

  resources :favorites
end

Rails.application.routes.draw do

  root to: "homes#index"

  resources :categories, only: [:index] do
    resources :treatments, only: [:index, :show]
  end
  get 'signin' => "sessions#new"
  resource :session

  resources :promotions, only: [:show]
  resources :products, only: [:index]

  get 'admin', to: 'dashboard#index'

  namespace :admin do
    resources :promotions do
      member do
        patch :hide
      end
    end

    resources :treatments
    resources :products
  end
end

Rails.application.routes.draw do

  root to: "homes#index"

  get 'gelaatsverzorgingen/:category_id', to: 'treatments#index', as: 'gelaatsverzorgingen'
  get 'make-up/:category_id', to: 'treatments#index', as: 'makeups'
  get 'lichaamsbehandelingen/:category_id', to: 'treatments#index', as: 'lichaamsbehandelingen'
  get 'manicure-pedicure-epilatie/:category_id', to: 'treatments#index', as: 'manicures'

  get 'behandelingen/:category_id', to: 'treatments#index', as: 'behandelingen'
  get 'behandeling/:id', to: 'treatments#show', as: 'behandeling'
  

  # resources :categories, path: '', except: [:index] do
  #   resources :treatments, only: [:index, :show]
  # end

  get 'signin' => "sessions#new"
  resource :session
  resources :contacts, only: [:new, :create]

  resources :promotions, only: [:show]

  get 'producten', to: 'products#index'

  get 'admin', to: 'dashboard#index'

  namespace :admin do
    resources :promotions do
      member do
        patch :hide
      end
    end

    resources :treatments
    resources :products
    resources :sections do
      collection { post :sort }
    end
  end
end

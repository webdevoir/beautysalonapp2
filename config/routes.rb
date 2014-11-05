Rails.application.routes.draw do

  root to: "homes#index"

  get 'admin', to: 'dashboard#index'

  namespace :admin do
    resources :promotions do
      member do
        patch :hide
      end
    end
  end
end

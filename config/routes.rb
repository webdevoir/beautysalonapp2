Rails.application.routes.draw do
  namespace :admin do
    resources :promotions do
      member do
        patch :hide
      end
    end
  end
end

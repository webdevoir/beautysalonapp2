Rails.application.routes.draw do
  namespace :admin do
    resources :promotions
  end
end

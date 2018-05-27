Rails.application.routes.draw do
  root "home#index"
  resources :shops, only: [:new, :create]
end

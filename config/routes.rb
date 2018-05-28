Rails.application.routes.draw do
  root "home#index"
  resources :shops, only: [:new, :create] do
    resources :favorites, only: :create
    resources :unfavorites, only: :create
  end
end

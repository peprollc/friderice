Rails.application.routes.draw do
  root "home#index"
  resources :shops, only: [:new, :create] do
    resources :favorites, only: :create
    resources :unfavorites, only: :create
  end
  resources :search_shops, only: :create

  get "/about", to: "home#about"

end

Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products
  post "/products/buy_now", to: "products#buy_now"
end

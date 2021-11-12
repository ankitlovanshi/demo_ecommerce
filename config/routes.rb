Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products
  get "/products", to: "products#buy_now"
end

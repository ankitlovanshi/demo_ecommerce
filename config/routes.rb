Rails.application.routes.draw do
  get 'images/index'
  get 'images/new'
  get 'images/show'
  devise_for :users
  root "products#index"

  resources :products
  post "/products/:id/buy_now", to: "products#buy_now"
end

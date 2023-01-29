Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products do
    member do
      post :buy_now
      post :add_to_cart
      get :my_order
      post :search
    end
  end

  resources :carts do
     member do
      post :cart_item_quantity
    end
  end
end
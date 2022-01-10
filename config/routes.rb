Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products do
    member do
      post :buy_now
      post :add_to_card
    end
  end
end


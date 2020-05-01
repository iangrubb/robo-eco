Rails.application.routes.draw do
  resources :robots, only: [:index, :show]
  resources :product_types, only: [:index, :show]
  resources :shipping_orders, only: [:index, :show]
  get '/', to: "home#home", as: "home"
end

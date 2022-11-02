Rails.application.routes.draw do
  resources :inventories
  resources :items
  resources :users
  get 'main/login'
  post 'main/create'
  get 'main/destroy'
  get 'main/user_Item', as: 'user_item' 
  get 'shop/:seller_id', to: 'shop#show', as: 'shop'
  post 'shop/:seller_id', to: 'shop#buy_item', as: 'shop_buy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

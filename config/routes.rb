Rails.application.routes.draw do
  resources :inventories
  resources :items
  resources :users
  get 'main/login'
  post 'main/create'
  get 'main/destroy'
  get 'main/user_Item', as: 'user_item' 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

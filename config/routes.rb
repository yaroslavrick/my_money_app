Rails.application.routes.draw do
  # get 'main/index'
  root "main#index"
  resources :operations
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
